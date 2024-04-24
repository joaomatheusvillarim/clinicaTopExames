# clinicaTopExames
Projeto de Banco de Dados I 2023.2

## Primeira fase: Esquema modelo Entidade-Relacionamento

![Diagrama MER](/img/diagramaMER.jpeg)

## Segunda fase: Esquema modelo Lógico-Relacional

![Diagrama LR](/img/diagramaLR.jpg)

## Terceira fase: Consultas

1. Liste o nome e email dos pacientes que marcaram um atendimento no qual o valor foi maior que R$ 500,00.
2. Liste as especialidades em que o nome dos médicos requisitante é o mais comum.
3. **Exiba o nome do convênio e o endereço do convênio e a quantidade de médicos
requisitantes que atendem pelo convênio, ordenando o resultado em ordem
decrescente.** [Solução](https://github.com/joaomatheusvillarim/clinicaTopExames/blob/main/sql/questao3.sql)
4. Liste o nome e cpf dos médicos requisitantes que solicitaram exames onde o prazo é
maior que 30 dias e menor que 60 dias.
5. Recupere o(s) nome(s) do(s) convênio(s) que o valor médio do atendimento é R$
300,00.
6. Mostre o nome do médicos eleboradores que possuem dependentes do sexo
feminino e que elas tenham mais de 50 anos.
7. Liste o CPF e nome dos pacientes que possuem mais de 60 anos, moram em
Campina Grande e que não tenham contrato com o convênio cujo nome é “Top
exames” .
8. Recupere o(s) nome(s) do(s) exame(s) em que o preço por atendimento está entre
R$ 80,00 e R$ 150,00.
9. Quais médicos elaboradores nunca realizaram o exame cujo nome é “hemograma”,
projete o nome e a especialidade.
10. Quais pacientes não fizeram nenhum atendimento em 2023 ou não possuem
convênio, projete o nome e cpf.