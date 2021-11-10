-------------------------Treino 3 -------------------------
--EX1
SELECT p.nome,p.marca,p.categoria_id, c.nome
FROM PRODUTO p 
JOIN categoria c ON p.categoria_id = c.id
WHERE UPPER(p.marca) LIKE 'PHILIPS'
------------
--EX2
SELECT v.data AS DATA_VENDA ,lv.id,lv.data AS DATA_LINHA_VENDA,lv.DESCONTO_UNIT_EUROS,lv.produto_id, p.nome
FROM linha_venda lv
JOIN produto p ON  lv.produto_id  = p.id
JOIN venda v ON  lv.venda_id  = v.id
WHERE UPPER(p.nome) LIKE UPPER('%monitor%');
------------
--EX3
SELECT ' [ '|| UPPER(l.cod) || ' ] '|| UPPER(l.nome) AS "Loja_cod_nome", LOWER(c.nome),UPPER(d.nome),
(EXTRACT(YEAR FROM CURRENT_DATE))-(EXTRACT(YEAR FROM l.data_abertura)) AS ANOS_VIDA 
FROM loja l
JOIN concelho c ON l.concelho_id = c.id
JOIN DISTRITO d ON c.distrito_id = d.id
WHERE UPPER(d.nome) LIKE UPPER('%Leiria%');
------------
--EX4
SELECT p.nome,(lv.preco_unit_venda-p.preco_unit_atual) AS DIFERENÇA, TO_CHAR(lv.data,'dd-MON-YYYY HH24:MI:SS') AS QUANDO
FROM linha_venda lv
JOIN produto p ON lv.produto_id = p.id
WHERE p.iva = 23
------------
--EX5
--Solucao 1
SELECT p.id,p.nome  from produto p 
MINUS
SELECT lv.produto_id,p.nome from linha_venda lv JOIN produto p ON lv.produto_id = p.id;
--Solucao 2
SELECT p.id,p.nome  from produto p 
WHERE p.id NOT IN(SELECT lv.produto_id from linha_venda lv);
------------
--EX6
SELECT c.nome AS CAT_nome, p.nome AS PROD_NOME, TO_CHAR(lv.data,'MON, YYYY'), l.cod
FROM Categoria c
JOIN Produto p ON c.id = p.categoria_id
JOIN Linha_venda lv ON p.id = lv.produto_id
JOIN venda v ON lv.venda_id = v.id
JOIN loja l ON v.loja_id = l.id
WHERE UPPER(c.nome) LIKE 'FRUTAS E LEGUMES' AND UPPER(l.cod) LIKE 'C-ONLIN'
------------
--EX7
--descobrir id categoria informática
SELECT id,nome from categoria WHERE UPPER(nome) LIKE '%INFORMÁTICA%'
--resoluçao
SELECT p.nome
FROM produto p
JOIN categoria c ON p.categoria_id = c.id
WHERE c.categoria_pai_id= 2 OR c.id = 2
------------
--EX8
--no rows
------------
--EX9
SELECT l.nome ||' - '|| UPPER(c.nome)
FROM loja l
JOIN concelho c ON l.concelho_id= c.id
UNION
SELECT '*'|| c.nome ||' é concelho de '|| d.nome
FROM concelho c
JOIN distrito d ON c.distrito_id= d.id;
