/*
QUESTÃO 3
Exiba o nome do convênio e o endereço do convênio e a quantidade de médicos
requisitantes que atendem pelo convênio, ordenando o resultado em ordem
decrescente.
*/

SELECT
  convenio.nome,
  convenio.endereco,
  COUNT(convenio_medico_requisitante.codigo_medico_requisitante) AS quantidade_medicos_convenio
FROM
  convenio
  LEFT JOIN convenio_medico_requisitante ON convenio.codigo_ans = convenio_medico_requisitante.codigo_ans
GROUP BY
  convenio.nome,
  convenio.endereco
ORDER BY
  quantidade_medicos_convenio DESC