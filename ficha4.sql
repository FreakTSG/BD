-------------------------Ficha 4 -------------------------
-----------
--EX1
--a
SELECT COUNT(*) As TOTAL_CATEGORIAS FROM Categoria;
--b
SELECT COUNT(*) As TOTAL_CATEGORIAS_COM_PAI FROM Categoria WHERE categoria_pai_id IS NOT NULL;
--c
SELECT COUNT(Categoria_pai_id) As TOTAL_CATEGORIAS_COM_PAI FROM Categoria;

--d
SELECT COUNT(*)-COUNT(Categoria_pai_id) As TOTAL_CATEGORIAS_SEM_PAI FROM Categoria;
-----------
--EX2
--a
SELECT COUNT(*) AS "TOTAL_PRODUTOS_IVA23", TRUNC(AVG(preco_unit_atual) ,0)  AS "PRECO_MEDIO"
FROM produto WHERE iva=23;
--b
SELECT COUNT(p.iva) AS "TOTAL_PRODUTOS_IVA23",
TRUNC(AVG(p.preco_unit_atual) ,0)  AS "PRECO_MEDIO",
SUM(lv.unidades) AS "UNIDADES_VENDIDAS"
FROM produto p JOIN linha_venda lv ON p.id = lv.produto_id
WHERE iva=23 AND lv.desconto_unit_euros > 0;
-----------
--EX3
SELECT TO_CHAR(MIN(data), 'day, dd/MON/yyyy') AS "PRIMEIRA_VENDA"
FROM venda;
-----------
--EX4
SELECT UPPER(c.nome) AS "CATEGORIA_NOME", COUNT(p.categoria_id) AS "TOTAL_PRODUTOS"
FROM produto p JOIN categoria c ON p.categoria_id = c.id
WHERE UPPER(c.nome) IN ('FRUTAS E LEGUMES','ARMAZENAMENTO')
GROUP BY c.nome;
-----------
--EX5
--a
SELECT TO_CHAR(data, 'yyyy-mm') AS "ANO-MÊS", COUNT(TO_CHAR(data, 'yyyy-mm')) AS "TOTAL_VENDAS"
FROM venda
GROUP BY TO_CHAR(data, 'yyyy-mm') ORDER BY TO_CHAR(data, 'yyyy-mm') ASC;
--b
SELECT TO_CHAR(data, 'yyyy-mm') AS "ANO-MÊS", loja_id, COUNT(TO_CHAR(data, 'yyyy-mm')) AS "TOTAL_VENDAS"
FROM venda
GROUP BY TO_CHAR(data, 'yyyy-mm'), loja_id
ORDER BY TO_CHAR(data, 'yyyy-mm');
-----------
--EX6
SELECT LOWER(c.nome) AS "CONCELHO_NOME", COUNT(l.concelho_id) AS "TOTAL_LOJAS"
FROM loja l JOIN concelho c ON l.concelho_id = c.id
GROUP BY c.nome;
-----------
--EX7
--a
SELECT UPPER(c.nome) AS "CATEGORIA_NOME", COUNT(p.categoria_id) AS "TOTAL_PRODUTOS"
FROM produto p JOIN categoria c ON p.categoria_id = c.id
GROUP BY c.nome
HAVING COUNT(p.categoria_id)>=2;
--b
SELECT UPPER(c.nome) AS "CATEGORIA_NOME", COUNT(p.categoria_id) AS "TOTAL_PRODUTOS", MAX(p.preco_unit_atual) AS PRODUTO_MAIS_CARO
FROM produto p JOIN categoria c ON p.categoria_id = c.id
GROUP BY c.nome
HAVING COUNT(p.categoria_id)>=2 AND MAX(p.preco_unit_atual)<20;
-----------
--EX8
SELECT v.id, sum(lv.unidades) AS TOTAL_UNIDADES,
SUM((NVL(lv.preco_unit_venda,0)-NVL(lv.desconto_unit_euros,0))*lv.unidades) AS TOTAL_PAGO
FROM venda v
JOIN linha_venda lv ON v.id = lv.venda_id 
GROUP BY v.id
HAVING SUM((NVL(lv.preco_unit_venda,0)-NVL(lv.desconto_unit_euros,0))*lv.unidades)>0

