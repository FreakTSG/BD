-- ex1
SELECT COUNT(*)
FROM vacina
WHERE laboratorio = 'GSK';

-- ex2
SELECT nome
FROM vacina
MINUS
SELECT vacina.nome
FROM vacinacao JOIN vacina ON vacinaçao.vacina_id = vacina.id;

SELECT vacina.nome
FROM vacinacao RIGHT JOIN vacina ON vacinaçao.vacina_id = vacina.id
WHERE vacinacao.vacina_id IS NULL;

-- ex3
SELECT TO_CHAR(vacinacao.data, 'mm-yyyy') AS "mes", COUNT(*) AS "total_vacinas"
FROM vacinacao JOIN vacina ON vacinacao.vacina_id = vacina.id
WHERE UPPER(vacina.doenca) LIKE '%TÉTANO%'
GROUP BY TO_CHAR(vacinacao.data, 'mm-yyyy');

-- ex4
SELECT SYSDATE-v.data AS "dias_passados", u.nome, u.sns_id, vac.doenca
FROM vacina vac JOIN vacinacao v ON vac.id = v.vacina_id JOIN utente u ON v.utente_id = u.id
WHERE UPPER(vac.doenca) LIKE '%TÉTANO%';