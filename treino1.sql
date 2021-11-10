-------------------------Treino 1 -------------------------
--EX1
SELECT nome FROM concelho where distrito_id =10;
------------
--EX2
select venda_id AS id_da_venda , preco_unit_venda 
from linha_venda where produto_id = 1060
------------
--EX3
select nome , marca , preco_unit_atual 
from produto WHERE categoria_id in (3 ,7) AND preco_unit_atual >1.5
------------
--EX4
select * from produto where nome in ('Maçã Fuji') and marca in ('BemBoa')
--id dos produtos 1070 1071
select id , nome from produto where nome in ('Caju a granel')
--nao existe
--criar caju a granel 
INSERT INTO produto(id,nome,marca,preco_unit_atual,iva,foto,categoria_id) 
VALUES (1111,'Caju a granel','Matutano',17.00,6,NULL,4);
--verificar inserção de Caju a granel
select id , nome,preco_unit_atual from produto where nome in ('Caju a granel')
--id do produto  1111
--verificar id loja online id=0
select id,cod,nome from loja where nome='online'
--criar a venda
INSERT INTO venda(id,data,loja_id) VALUES (1,TO_DATE('2021-09-21','yyyy-mm-dd'),0);
INSERT INTO venda(id,data,loja_id) VALUES (2,TO_DATE('2021-09-20','yyyy-mm-dd'),0);
--linha de venda 1
INSERT INTO linha_venda (id,data,produto_id,preco_unit_venda,unidades,desconto_unit_euros,venda_id) 
VALUES (5200,TO_DATE('2021-09-12 15:25:00','yyyy-mm-dd hh24:mi:ss'),1070,1.43,2.340,null,1);
--linha de venda 2
INSERT INTO linha_venda (id,data,produto_id,preco_unit_venda,unidades,desconto_unit_euros,venda_id) 
VALUES (5202,TO_DATE('2021-09-12 15:26:00','yyyy-mm-dd hh24:mi:ss'),1111,17.00,0.250,null,2);
COMMIT;
-------------Escolha multipla-------------
--EX1
A e C
------------
--EX2
E
------------
--EX3
C
------------
--EX4
A, D, F
------------
--EX5
A
------------
--EX6
A
------------
--EX7
B
------------
--EX8
A3, B2, C5, D1, E6, F7, G4
------------
--EX9
B D
------------
--EX10
B, C, F
