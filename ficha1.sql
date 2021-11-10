-------------------------Ficha 1 -------------------------
--EX1
--verificar id de perifericos
SELECT id, nome from CATEGORIA where nome= 'PERIFÉRICOS';
--inserir nova categoria
INSERT INTO categoria (id,nome,categoria_pai_id) VALUES (25,'RATOS',6);
-----------
--EX2
--inserir novo produto
INSERT INTO produto(id,nome,marca,preco_unit_atual,iva,foto,categoria_id) 
VALUES (2005,'Rato SCULPT MOBILE FLAME RED','Microsoft',26.56,23,NULL,25);
-----------
--EX3
--verificar id da loja
SELECT id, nome from loja where nome= 'Modelo Eiras'
--inserir a venda
INSERT INTO venda(id,data,loja_id) 
VALUES (3000,TO_DATE('2021-08-10','yyyy-mm-dd'),2);
-----------
--EX4
--ver nome e marca dos produtos da loja
SELECT nome , marca from produto;
-----------
--EX5
--ordenar de A a Z
SELECT nome , marca from produto ORDER BY nome ASC;
-----------
--EX6
--ordenar do mais recente para o primeiro
Select * from loja ORDER BY data_abertura DESC;
-----------
--EX7
--ver nome e id produto mas ordenar por preço mais caro para mais barato
select nome, id from produto where preco_unit_atual>10 order by preco_unit_atual DESC
-----------
--EX8
--ver qual os nome dos concelhos
select id, nome from concelho where id in (1009 ,0603);
--selecionar nome de loja dos concelhhos 1009 e 0603 e primeiro os do 0603 e depois os do 1009
select nome from loja where concelho_id in (1009 ,0603) ORDER BY concelho_id ASC
-----------
--EX9
--verificar os produtos com erro
SELECT id, nome, marca from produto where marca = 'QINGSTON'
--corrigir a marca
UPDATE produto SET marca = 'KINGSTON' WHERE id in (1058 ,1060)
--verificar alteração
SELECT id, nome, marca from produto where marca = 'KINGSTON'
-----------
--EX10
--ver produto 1060
select id, nome, categoria_id  from produto where id= 1060
--tentar realizar alteração
UPDATE produto SET categoria_id = 30 WHERE id = 1060
-- nao e possivel realizar alteração devido nao existir categoria 30
select id ,nome from categoria where id = 30
-----------
--EX11
--ver os produtos com nome  LIXO
select id ,nome from produto where nome = 'LIXO'
--eliminar produtos nome lixo
DELETE FROM produto WHERE nome = 'LIXO';
--verificar eliminação
select id ,nome from produto where nome = 'LIXO'
-----------
--EX12
--verificar a venda
select * from venda where id = 1000
--eliminar a venda
DELETE FROM venda WHERE id = 1000;
--deixa eliminar devido a ter sido associada a outro registo na linha de vendas
--verificar os registo com a venda 1000
Select id , produto_id , venda_id from linha_venda where venda_id = 1000
--para poder eliminar a venda 1000 sera necessario remover a linhas de venda a que esta associado
DELETE FROM linha_venda WHERE venda_id = 1000;
--tentar remover a venda 1000 JA FUNCA
DELETE FROM venda WHERE id = 1000;
-----------
--EX13
COMMIT
-----------
--EX14
--elminar distrito lisboa
DELETE FROM distrito WHERE nome = 'Lisboa';
--verificar s efoi eliminado
select id ,nome from distrito where nome = 'Lisboa';
-- voltar ate ao nosso commit
ROLLBACK
--verificar se com roolback voltamos a ter distirto lisboa
select id ,nome from distrito where nome = 'Lisboa';
--esta operação foi cancelada pq as operações anteriores nao foram canceladas devido ao uso
--do COMMIT para encerrar sua transação atual e tornar permanentes todas as alterações realizadas na transação
-- como nesta opeção de eliminar o distrito nao realizamos o commit mas sim rollback voltamos ao estado ate ao ultimo commit