/*
QUESTÃO 10
Quais pacientes não fizeram nenhum atendimento em 2023 ou não possuem
convênio, projete o nome e cpf.
*/

--pacientes que não tem convênio 
SELECT
  paciente.nome,
  paciente.cpf
FROM
  paciente
  LEFT JOIN paciente_convenio
    ON paciente.cpf = paciente_convenio.cpf_paciente
WHERE
  paciente_convenio.codigo_ans IS NULL;

--pacientes que não fizeram atendimentos em 2023
SELECT
  paciente.nome,
  atendimento.cpf_paciente
FROM
  paciente
  LEFT JOIN atendimento
  ON paciente.cpf = atendimento.cpf_paciente
WHERE
  EXTRACT(YEAR FROM atendimento.data_atendimento) <> 2023
ORDER BY
  paciente.nome ASC;

--tentativa de juntar as condições
-- problema: resultados duplicados
SELECT
  paciente.nome,
  paciente.cpf
FROM
  paciente
  LEFT JOIN paciente_convenio
    ON paciente.cpf = paciente_convenio.cpf_paciente
  LEFT JOIN atendimento
    ON paciente.cpf = atendimento.cpf_paciente
WHERE
  paciente_convenio.codigo_ans IS NULL OR
  EXTRACT(YEAR FROM atendimento.data_atendimento) <> 2023
ORDER BY
  paciente.nome ASC;