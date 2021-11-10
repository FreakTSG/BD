-------------------------Ficha 4 -------------------------
-----------
--EX1
SELECT e.nomeemp,d.nomedep, e.salario 
FROM empregado e
JOIN departamento d ON e.numdep = d.numdep
WHERE e.salario>(SELECT ROUND(AVG(salario),2) AS salario_medio from empregado)
-----------
--EX2
SELECT e.nomeemp, e.salario ,d.nomedep||'{'||d.localizacao||'}' AS Departamento
FROM empregado e
JOIN departamento d ON e.numdep = d.numdep
WHERE e.salario>1500
ORDER BY 2 ASC
-----------
--EX3
SELECT e.numdep, COUNT(e.nomeemp), MAX(e.salario)
FROM empregado e 
GROUP BY e.numdep
-----------
--EX4
SELECT d.nomedep
FROM empregado e 
JOIN departamento d ON e.numdep = d.numdep
WHERE e.salario=(SELECT MIN(salario)FROM empregado)
-----------
--EX5
--salario medio
SELECT ROUND(AVG(salario),2) AS salario_medio from empregado
--salario medio por departamento
SELECT ROUND(AVG(e.salario),2) AS salario_medio from empregado e GROUP BY e.numdep
--resolucao
SELECT d.nomedep
FROM empregado e
JOIN departamento d ON e.numdep = d.numdep
GROUP BY d.nomedep
HAVING ROUND(AVG(e.salario),2)<=(SELECT ROUND(AVG(salario),2) from empregado)
-----------
--EX6
SELECT '{'||e.numemp||'}'|| e.nomeemp AS EMPREGADO , e.chefe AS CHEFE_NUM,c.nomeemp AS CHEFE_NOME
FROM empregado e
JOIN empregado c ON e.chefe = c.numemp
WHERE e.numdep NOT IN (30,40)
ORDER BY e.nomeemp ASC
-----------
--EX7
SELECT e.funcao, ROUND(AVG(e.salario),0) AS MEDIA_SALARIAL,TRUNC(SUM(14*e.salario+NVL(e.comissao,0))/1000,0)||'K' AS volume_sal_anual
FROM empregado e
GROUP BY e.funcao
ORDER BY e.funcao ASC
-----------
--EX8
--Opcao 1
SELECT COUNT(e.numemp),d.nomedep
from empregado e
RIGHT JOIN departamento d ON e.numdep = d.numdep
group by d.nomedep
HAVING COUNT(e.numemp)=0
--Opcao 2
SELECT nomedep from departamento
MINUS
SELECT d.nomedep from empregado e join departamento d on d.numdep=e.numdep
--Opcao 3 -- SUbConsulta

-----------
--EX9
SELECT numemp, nomeemp 
from empregado
WHERE numdep= (SELECT numdep 
                from empregado 
                    WHERE UPPER(funcao) LIKE 'PRESIDENTE') 
    AND UPPER(funcao)!= 'PRESIDENTE'
-----------
--EX10 -- Meio certo
SELECT TO_CHAR(e.dtacontratacao,'YYYY'), COUNT(e.numemp)
FROM empregado e
GROUP BY TO_CHAR(e.dtacontratacao,'YYYY')
--EX10 -- CERTO
SELECT query1.*
FROM
  (SELECT TO_CHAR(dtacontratacao, 'YYYY'),
          COUNT(numemp) AS num
   FROM empregado
   GROUP BY TO_CHAR(dtacontratacao, 'YYYY'))query1,

  (SELECT max(query2.num) AS high_num
   FROM
     (SELECT TO_CHAR(dtacontratacao, 'YYYY'),
             COUNT(numemp) AS num
      FROM empregado
      GROUP BY TO_CHAR(dtacontratacao, 'YYYY'))query2)query3
WHERE query1.num = query3.high_num;
-----------
--EX11
SELECT e.nomeemp,
CASE d.nomedep
  WHEN 'Vendas' THEN '30'
  ELSE d.nomedep
END
FROM departamento d 
JOIN empregado e ON d.numdep=e.numdep
WHERE d.nomedep IN ('Vendas','Contabilidade','Pesquisa')
ORDER BY 2