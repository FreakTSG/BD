-------------------------Ficha 6 -------------------------
--EX1
SELECT COUNT(*) AS "Vendas depois da primeira"
FROM linha_venda
WHERE data >(SELECT MIN(data) FROM linha_venda);
------------
--EX2
SELECT *
FROM linha_venda
WHERE desconto_unit_euros = (SELECT MAX(desconto_unit_euros) FROM linha_venda);
------------
--EX3
SELECT *
FROM loja
WHERE id NOT IN (SELECT loja_id FROM venda);
------------
--EX4
--ajuda a resolucao
SELECT loja_id ,COUNT(loja_id) FROM venda GROUP BY loja_id HAVING COUNT(loja_id)>2
--resolucao
SELECT *
FROM loja
WHERE id  IN (SELECT loja_id FROM venda GROUP BY loja_id HAVING COUNT(loja_id)>2);
------------
--EX5
SELECT p.id, p.nome, p.categoria_id, subq.menor_preco
FROM produto p 
JOIN (SELECT categoria_id, MIN(preco_unit_atual) AS menor_preco
FROM produto             
GROUP BY categoria_id ) subq ON p.categoria_id = subq.categoria_id
ORDER BY p.categoria_id;
------------
--EX6
SELECT id, nome, preco_unit_atual FROM produto;

SELECT nome, preco_unit_atual,(SELECT nome FROM produto WHERE id = :id_produto_base) AS Produto_base
FROM produto
WHERE preco_unit_atual > (SELECT preco_unit_atual FROM produto WHERE id = :id_produto_base);

------------
--EX7
SELECT p.id, p.nome, subp.preco_unit_atual
FROM produto p JOIN (SELECT id, preco_unit_atual
                     FROM produto
                     ORDER BY preco_unit_atual DESC) subp
               ON p.id = subp.id 
WHERE ROWNUM<=3
ORDER BY p.nome ASC;

SELECT p.categoria_id, c.nome, p.total_produtos
FROM categoria c JOIN (SELECT categoria_id, COUNT(*) AS total_produtos
                       FROM produto
                       GROUP BY categoria_id) p
                 ON c.id = p.categoria_id
ORDER BY 1 ASC;
------------
--EX8
SELECT p.categoria_id, c.nome, COUNT(*) AS "total_produtos"
FROM categoria c JOIN produto p
        ON c.id = p.categoria_id
GROUP BY p.categoria_id, c.nome
HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM produto GROUP BY categoria_id)
ORDER BY 1 ASC;
