-------------------------Ficha 1 -------------------------
--EX1
SELECT nome, preco_unit_atual from produto where preco_unit_atual>9.9 ORDER BY preco_unit_atual ASC;
-----------
--EX2
SELECT nome, id from produto where marca IS NULL;
-----------
--EX3
select nome || '['|| marca ||']' AS PRODUTOS_COM_MARCA from produto where marca IS NOT NULL
-----------
--EX4
SELECT id ,nome, categoria_pai_id from categoria where id= 1 OR categoria_pai_id=1 ;
-----------
--EX5
SELECT nome, preco_unit_atual*(iva/100)+preco_unit_atual from produto where categoria_id in (6,20)
-----------
--EX6
SELECT nome || ' -> '|| (preco_unit_atual*(iva/100)+preco_unit_atual)  AS "Produto/Preco",marca 
from produto where marca != 'KINGSTON' or marca IS NULL
-----------
--EX7
SELECT cod, TO_CHAR(data_abertura,'YYYY') AS "Ano de Abertura" FROM loja;
-----------
--EX8
SELECT nome, Round(preco_unit_atual*(iva/100)+preco_unit_atual,1) AS PRECO_ARREDONDADO 
from produto where categoria_id in (7,18)
-----------
--EX9
--a
SELECT id ,nome, categoria_pai_id from categoria;
--b
SELECT id ,nome, NVL(to_char(categoria_pai_id),'n/a') AS "Categoria Pai Id"  from categoria;
-----------
--EX10
SELECT cod,nome, TO_CHAR(data_abertura,'YYYY') AS "Ano de Abertura" FROM Loja  WHERE id !=0 AND TO_CHAR(data_abertura,'yyyy') > 1999;
-----------
--EX11
SELECT nome,preco_unit_atual AS "preco_s_iva", (preco_unit_atual*(iva/100)+preco_unit_atual) AS "preco_iva"
from produto  WHERE UPPER(nome) LIKE UPPER('%Maçã%');
-----------
--EX12
SELECT nome, data_abertura  FROM Loja WHERE UPPER(nome) LIKE UPPER('%contente%');
SELECT CURRENT_DATE AS "DATA ATUAL" FROM DUAL;
SELECT nome, ROUND(CURRENT_DATE-data_abertura,0) AS Dias_Vida FROM loja WHERE UPPER(nome) LIKE UPPER('%contente%');
SELECT nome, ROUND(MONTHS_BETWEEN(CURRENT_DATE, data_abertura),0) AS MESES_VIDA FROM loja WHERE UPPER(nome) LIKE UPPER('%contente%');
SELECT nome, (EXTRACT(YEAR FROM CURRENT_DATE))-(EXTRACT(YEAR FROM data_abertura)) AS ANOS_VIDA FROM loja WHERE UPPER(nome) LIKE UPPER('%contente%');
-----------
--EX13
--nvl pq vendas podem nao ter desconto
SELECT venda_id, id AS LINHA_DE_VENDA, nvl((preco_unit_venda*unidades)-desconto_unit_euros, preco_unit_venda) AS VALOR_PAGO FROM linha_venda WHERE venda_id = 1459;
-----------
--EX14
SELECT id, nome, iva,
CASE iva
  WHEN 6 THEN 'reduzida'
  WHEN 12 THEN 'intermédia'
  ELSE 'normal'
END
FROM produto WHERE preco_unit_atual < 15 ORDER BY iva, nome ASC;

