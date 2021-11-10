-------------------------Ficha 3 -------------------------
-----------
--EX1
--a
SELECT p.nome AS "Product_name",
 p.categoria_id AS "Product_cat_id"
FROM produto p WHERE iva=23
--b
SELECT p.nome AS "Product_name",
 p.categoria_id AS "Product_cat_id",
 c.id AS Categoria_ID,
 c.nome AS Categoria_Name
FROM produto p 
JOIN categoria c ON p.categoria_id = c.id
WHERE iva=23;
-----------
--EX2
--a
SELECT l.id AS Loja_Id, 
l.nome AS Loja_nome, 
l.concelho_id AS L_Concelho_Id
From loja l WHERE l.id = 0;
--b
SELECT l.id AS Loja_Id, 
l.nome AS Loja_nome, 
l.concelho_id AS L_Concelho_Id,
c.nome AS Concelho_nome
From loja l 
JOIN concelho c ON l.concelho_id = c.id
WHERE l.id = 0;
--c
SELECT l.id AS Loja_Id, 
l.nome AS Loja_nome, 
l.concelho_id AS L_Concelho_Id,
c.nome AS Concelho_nome,
d.nome AS Distrito_nome
From loja l 
JOIN concelho c ON l.concelho_id = c.id
JOIN distrito d ON c.distrito_id = d.id
WHERE l.id = 0;
-----------
--EX3
SELECT p.id AS "Product_Id",
p.nome AS "Product_name", 
 c.nome AS Categoria_Name
FROM produto p 
JOIN categoria c ON p.categoria_id = c.id
WHERE UPPER(c.nome) in ('ARMAZENAMENTO' ,'PERIFÉRICOS') 
-----------
--EX4
SELECT v.id,
l.nome AS loja_name,
p.id AS PRod_id,
p.nome AS PRod_nome,
lv.unidades AS Unidades
FROM venda v
JOIN loja l ON v.loja_id = l.id
JOIN linha_venda lv ON v.id = lv.venda_id
JOIN produto p ON lv.produto_id = p.id
WHERE to_char(v.data,'dd-mm-yyyy') LIKE '01-07-2021' AND UPPER(l.nome) in ('MODELO EIRAS')
-----------
--EX5
--a
SELECT v.id, to_char(v.data,'yyyy/MONTH') AS Mês
FROM venda v
WHERE to_char(v.data,'mm') LIKE '06';
--b
SELECT v.id, to_char(v.data,'yyyy/MONTH') AS Mês,
lv.produto_id
FROM venda v
JOIN linha_venda lv ON v.id = lv.venda_id
WHERE to_char(v.data,'mm') LIKE '06';
--c
SELECT v.id, to_char(v.data,'yyyy/MONTH') AS Mês,
lv.produto_id
FROM venda v
LEFT JOIN  linha_venda lv ON v.id = lv.venda_id
WHERE to_char(v.data,'mm') LIKE '06';
-----------
--EX6
SELECT c.nome AS CAT_nome, p.nome AS PROD_NOME
FROM Categoria c
LEFT JOIN Produto p ON c.id = p.categoria_id
WHERE UPPER(c.nome) IN('CEREAIS','FRUTAS E LEGUMES','FRUTOS SECOS')
-----------
--EX7
SELECT c.nome FROM concelho c
MINUS
SELECT c.nome FROM concelho c JOIN loja l ON c.id = l.concelho_id
-----------
--EX8
SELECT lv.produto_id 
FROM linha_venda lv JOIN venda v ON lv.venda_id = v.id  
WHERE to_char(v.data,'dd-mm-yyyy') LIKE '30-06-2021' 
INTERSECT
SELECT lv.produto_id 
FROM linha_venda lv JOIN venda v ON lv.venda_id = v.id  
WHERE to_char(v.data,'dd-mm-yyyy') LIKE '01-07-2021'
-----------
--EX9
SELECT '[D]'||UPPER(d.nome) AS REGIOES from distrito d
UNION
SELECT '[C]'||LOWER(c.nome) AS REGIOES from concelho c ORDER BY REGIOES DESC