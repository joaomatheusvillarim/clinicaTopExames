/*
QUESTÃO 1
Liste o nome e email dos pacientes que marcaram um atendimento no qual o valor
foi maior que R$ 500,00.
*/

SELECT
  paciente.nome,
  paciente.email
FROM
  PACIENTE paciente,
  ATENDIMENTO atendimento,
  EXAME_PROVIDO exame
WHERE
  paciente.CPF = atendimento.CPF_PACIENTE AND
  atendimento.CODIGO = exame.CODIGO_EXAME AND
  exame.PRECO > 500;