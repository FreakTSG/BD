
-------------------------Treino 4 -------------------------
--EX1
SELECT COUNT(nome) As PRODUTOS_COM_MAÇA 
FROM Produto
WHERE LOWER(nome) LIKE '%maçã%';
------------
--EX2
--a
SELECT COUNT(l.id), d.nome 
FROM Loja l
JOIN concelho c ON l.concelho_id = c.id
JOIN distrito d ON c.distrito_id = d.id
GROUP BY d.nome
ORDER BY 1 DESC
--b
SELECT COUNT(l.id), d.nome 
FROM Loja l
JOIN concelho c ON l.concelho_id = c.id
RIGHT JOIN distrito d ON c.distrito_id = d.id
GROUP BY d.nome
ORDER BY 1 DESC
------------
--EX3
SELECT  p.iva, ROUND(AVG(p.preco_unit_atual),2)  AS "PRECO_MEDIO"
FROM produto p
GROUP  BY p.iva
ORDER BY 1 ASC
------------
--EX4
--a
SELECT SUM(lv.unidades*NVL(lv.desconto_unit_euros,0)) AS DESCONTO_DADOS from 
linha_venda lv
--b
SELECT CASE UPPER(l.nome)
  WHEN 'ONLINE' THEN 'ONLINE'
  ELSE '<lojas físicas>'
END AS LOJA, SUM(lv.unidades*NVL(lv.desconto_unit_euros,0)) AS DESCONTO_DADOS 
from loja l
JOIN venda v ON l.id=v.loja_id
JOIN linha_venda lv ON  v.id=lv.venda_id
GROUP BY l.nome
------------
SELECT CASE UPPER(l.nome)
  WHEN 'ONLINE' THEN 'ONLINE'
  ELSE '<lojas físicas>'
END
From loja l
------------
--EX5
SELECT COUNT(l.nome)AS LOJAS_CONTENTE_COIMBRA
FROM loja l
JOIN concelho c ON l.concelho_id = c.id
WHERE LOWER(l.nome) LIKE '%contente%' AND l.nome(c.nome) LIKE '%COIMBRA%'
------------
--EX6
SELECT (EXTRACT(YEAR FROM l.data_abertura)) AS ANO, COUNT(l.id)AS LOJAS_ABERTAS
FROM loja l
GROUP BY (EXTRACT(YEAR FROM l.data_abertura))
ORDER BY 2 ASC
------------
--EX7
SELECT  c.nome
From produto p 
JOIN categoria c ON p.categoria_id = c.id
GROUP BY c.nome
HAVING COUNT(p.id)=1
------------
--EX8
--chegar ao resultado
SELECT data from linha_venda
SELECT MIN(data) from linha_venda
--resolucao
SELECT ROUND(CURRENT_DATE-MIN(data),0) AS Dias_Vida 
FROM linha_venda
------------
--EX9
SELECT c.nome AS CATEGORIA_NOME,AVG(p.preco_unit_atual) AS PRECO_MEDIO
FROM categoria c
JOIN produto p ON c.id=p.categoria_id
GROUP BY c.nome
HAVING AVG(p.preco_unit_atual)>15
ORDER BY 2 ASC
------------
--EX10
SELECT 
CASE
  WHEN TO_CHAR(lv.data,'HH24')<='12' THEN 'MANHA'
  else 'TARDE'
END AS HORAS, lv.unidades
FROM linha_venda lv

SELECT 'manhã'AS HORARIO,SUM(lv.unidades)AS UNIDADES_VENDIDAS FROM linha_venda lv 
WHERE TO_CHAR(lv.data,'HH24')<='12'
UNION
SELECT 'tarde' , SUM(lv.unidades)  FROM linha_venda lv 
WHERE TO_CHAR(lv.data,'HH24')>'12'

