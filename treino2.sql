-------------------------Treino 2 -------------------------
--EX1
SELECT nome FROM concelho where distrito_id =10;
------------
--EX2
SELECT UPPER(nome) from produto WHERE preco_unit_atual BETWEEN 15 AND 20 ORDER BY nome ASC;
------------
--EX3
SELECT id,TO_CHAR(data, 'MON-YYYY , DD') AS DATA from linha_venda WHERE desconto_unit_euros IS NULL;

------------
--EX4
SELECT id,desconto_unit_euros,data from linha_venda WHERE (EXTRACT(MONTH FROM data))=7 AND desconto_unit_euros IS NOT NULL;
------------
--EX5
SELECT nome, preco_unit_atual AS "Preco_sem_Iva",preco_unit_atual*(iva/100)+preco_unit_atual AS "Preco_com_Iva",
preco_unit_atual*(iva/100) AS "Iva a pagar"
from produto WHERE UPPER(nome) LIKE UPPER('%monitor%') AND preco_unit_atual<200;
------------
--EX6-DUVIDA
 SELECT nome, ROUND((MONTHS_BETWEEN(CURRENT_DATE, data_abertura)/12),0) AS "ANOS" 
 FROM loja 
 WHERE UPPER(COD) LIKE UPPER('C-ONLIN');
------------
--EX7