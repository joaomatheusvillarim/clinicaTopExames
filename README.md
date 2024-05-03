# clinicaTopExames
Projeto de Banco de Dados I 2023.2

## Primeira fase: Esquema modelo Entidade-Relacionamento
A TopExames é uma clinica de exames medicos que deseja automatizar suas atividades 
e para tanto é preciso modelar um banco de dados. O banco de dados contém pacientes 
com informações sobre CPF, nome, endereço (rua, número, bairro, cidade, estado, 
CEP), data de nascimento, sexo, telefone e email. Um paciente pode ter vários 
convênios. Um convênio tem vários pacientes, cada convênio de um dado paciente 
possui data_expiração e um número. As informacões sobre convênios são: código ANS, 
CNPJ, nome, endereço, telefones, email. Cada médico_requisitante que solicita 
exames possui CRM_numero, nome, especialidade, endereço, telefones. Um médico_requisitante
pode atender por vários convênios e um convênio possui vários médicos. Existem os 
médicos_elaboradores que realizam os exames da clínica, para cada um tem-se código, 
CPF. CRM_numero, nome, especialidade, endereço, telefone, salário, carga horária, 
data_ admissão, data_demissão, especialidade. São cadastrados todos os tipos de 
exames do laboratório com informações sobre código, nome_ do_exame, material_utilizado_coleta,
prazo_exame_dias, e observacão. Um Paciente tem um atendimento, com data e hora, 
médico_requisitante, convênio utilizado e um conjunto de exames a serem realizados. 
Para cada exame guarda-se os timestamp_coleta, timestamp_ liberação, resultado.
Os convênios possuem os exames que podem ser realizados, e os exames podem ser 
realizados por diversos convênios. Cada par: exame_convênio tem um preço associado.

![Diagrama MER](/img/diagramaMER.jpeg)

## Segunda fase: Esquema modelo Lógico-Relacional

![Diagrama LR](/img/diagramaLR.jpg)

## Terceira fase: Consultas

1. Liste o nome e email dos pacientes que marcaram um atendimento no qual o valor 
foi maior que R$ 500,00. [Solução](https://github.com/joaomatheusvillarim/clinicaTopExames/blob/main/sql/questao1.sql)
2. Liste as especialidades em que o nome dos médicos requisitantes é o mais comum. [Solução](https://github.com/joaomatheusvillarim/clinicaTopExames/blob/main/sql/questao2.sql)
3. Exiba o nome do convênio e o endereço do convênio e a quantidade de médicos
requisitantes que atendem pelo convênio, ordenando o resultado em ordem
decrescente. [Solução](https://github.com/joaomatheusvillarim/clinicaTopExames/blob/main/sql/questao3.sql)
4. Liste o nome e cpf dos médicos requisitantes que solicitaram exames onde o 
prazo é maior que 30 dias e menor que 60 dias. [Solução](https://github.com/joaomatheusvillarim/clinicaTopExames/blob/main/sql/questao4.sql)
5. Recupere o(s) nome(s) do(s) convênio(s) que o valor médio do atendimento é R$
300,00. [Solução](https://github.com/joaomatheusvillarim/clinicaTopExames/blob/main/sql/questao5.sql)
6. Mostre o nome do médicos eleboradores que possuem dependentes do sexo
feminino e que elas tenham mais de 50 anos. [Solução](https://github.com/joaomatheusvillarim/clinicaTopExames/blob/main/sql/questao6.sql)
7. Liste o CPF e nome dos pacientes que possuem mais de 60 anos, moram em 
Campina Grande e que não tenham contrato com o convênio cujo nome é “Top
exames”. [Solução](https://github.com/joaomatheusvillarim/clinicaTopExames/blob/main/sql/questao7.sql)
8. Recupere o(s) nome(s) do(s) exame(s) em que o preço por atendimento está entre
R$ 80,00 e R$ 150,00. [Solução](https://github.com/joaomatheusvillarim/clinicaTopExames/blob/main/sql/questao8.sql)
9. Quais médicos elaboradores nunca realizaram o exame cujo nome é “hemograma”,
projete o nome e a especialidade. [Solução](https://github.com/joaomatheusvillarim/clinicaTopExames/blob/main/sql/questao9.sql)
10. Quais pacientes não fizeram nenhum atendimento em 2023 ou não possuem 
convênio, projete o nome e cpf. [Solução](https://github.com/joaomatheusvillarim/clinicaTopExames/blob/main/sql/questao10.sql)

## Quarta fase: Triggers
1. Implemente uma função PL/SQL chamada calcula_total_salario_elaborador.
Esta função deverá receber a especialidade de um médico elaborador e
retornar a soma de salário dos médicos que possuem essa especialidade.
2. Implemente uma procedure chamada remove_paciente_convenio. Esta
procedure recebe o cpf do paciente e o codigo_ans do convênio e apaga do
banco qualquer relação de entre o paciente e convênio fornecidos.
3. Implemente uma função chamada preco_medio_exames_convenio. Essa
função recebe o código_ans do convênio e retorna a média do valor de todos
os exames providos pelo o convênio.
4. Crie uma visão que mostra os dependentes de médicos elaboradores que
possuem salário maior que 20000 R$ e que já realizaram pelo menos um 
exame com o nome de “Radiografia”.
5. Crie uma visão que mostre os pacientes que possuem algum atendimento
onde o médico requisitante responsável pelo atendimento mora na mesma
cidade do paciente. Exiba o nome do paciente e a cidade.
6. Crie uma visão que liste o nome de todos os convênios que possuem pelo
menos um exame elaborado pelo médico elaborador cujo seu CRM_numero
é igual a 1111.
7. Crie uma visão que exiba o nome (forma) da forma de pagamento e quantos
atendimento foram pagos usando essa forma de pagamento.
8. Crie um trigger que impeça a inserção de exame que tenha o atributo
resultado como vazio ou nulo.
9. Crie um trigger para modificar o nome do dependente deixando a primeira
letra no nome sempre maiúscula quando esse dado for inserido ou
atualizado.
10. Crie um trigger que impeça a inserção ou atualização do preço de um exame
relacionado com convênio que seja menor que 30,00 R$.