-- Médicos
INSERT INTO MEDICO_ELABORADOR (CODIGO, CPF, CNPJ, CRM_NUMERO, CRM_ESTADO, NOME, ESPECIALIDADE, ENDERECO, TELEFONE, SALARIO, CARGA_HORARIA, DATA_ADMISSAO, DATA_DEMISSAO)
VALUES
(1, '11111111111', '00000000000000', '123456', 'BA', 'Dr. José da Silva', 'Cardiologia', 'Rua A, 123', '111122223333', 10000.00, 40, TO_DATE('01/01/2023', 'DD/MM/YYYY'), NULL),
(2, '22222222222', '00000000000000', '654321', 'PE', 'Dra. Maria Souza', 'Pediatria', 'Av. B, 456', '222233334444', 9000.00, 35, TO_DATE('15/03/2022', 'DD/MM/YYYY'), NULL),
(3, '33333333333', '00000000000000', '987654', 'CE', 'Dr. Carlos Ferreira', 'Ortopedia', 'Rua C, 789', '333344445555', 28500.00, 38, TO_DATE('20/07/2022', 'DD/MM/YYYY'), NULL),
(4, '44444444444', '00000000000000', '135790', 'BA', 'Dra. Ana Oliveira', 'Ginecologia', 'Av. D, 1011', '444455556666', 9200.00, 36, TO_DATE('10/05/2023', 'DD/MM/YYYY'), NULL),
(5, '55555555555', '00000000000000', '246801', 'PE', 'Dr. Paulo Costa', 'Dermatologia', 'Rua E, 1213', '555566667777', 8800.00, 37, TO_DATE('30/11/2021', 'DD/MM/YYYY'), NULL),
(6, '66666666666', '00000000000000', '369258', 'CE', 'Dra. Fernanda Santos', 'Oftalmologia', 'Av. F, 1415', '666677778888', 9300.00, 39, TO_DATE('28/02/2023', 'DD/MM/YYYY'), NULL),
(7, '77777777777', '00000000000000', '987123', 'BA', 'Dr. Ricardo Lima', 'Neurologia', 'Rua G, 1617', '777788889999', 8700.00, 34, TO_DATE('05/09/2022', 'DD/MM/YYYY'), NULL),
(8, '88888888888', '00000000000000', '258369', 'PE', 'Dra. Sandra Almeida', 'Psiquiatria', 'Av. H, 1819', '888899990000', 9400.00, 40, TO_DATE('10/01/2022', 'DD/MM/YYYY'), NULL),
(9, '99999999999', '00000000000000', '753159', 'CE', 'Dr. Luiz Gonzaga', 'Urologia', 'Rua I, 2021', '999900001111', 9100.00, 38, TO_DATE('20/03/2023', 'DD/MM/YYYY'), NULL),
(10, '10101010101', '00000000000000', '951357', 'BA', 'Dra. Patricia Ramos', 'Oncologia', 'Av. J, 2223', '101011112222', 9600.00, 40, TO_DATE('15/06/2022', 'DD/MM/YYYY'), NULL);

--Dependentes
INSERT INTO DEPENDENTE (CODIGO_DEPENDENTE, CODIGO_MEDICO_ELABORADOR, NOME, IDADE, SEXO)
VALUES
(1, 1, 'Maria Silva', 10, 'F'),
(2, 1, 'José Silva', 8, 'M'),
(1, 2, 'Ana Souza', 15, 'F'),
(1, 3, 'Pedro Ferreira', 20, 'M'),
(2, 3, 'Mariana Ferreira', 18, 'F'),
(1, 4, 'Gabriel Oliveira', 5, 'M'),
(2, 4, 'Lara Oliveira', 3, 'F'),
(3, 4, 'Rafaela Oliveira', 8, 'F'),
(1, 5, 'Lucas Costa', 12, 'M'),
(1, 6, 'Vitor Santos', 25, 'M'),
(2, 6, 'Carla Santos', 20, 'F'),
(3, 6, 'Pedro Santos', 18, 'M'),
(1, 8, 'Marcos Almeida', 30, 'M'),
(2, 8, 'Juliana Almeida', 28, 'F'),
(3, 8, 'Renato Almeida', 5, 'M'),
(1, 9, 'Joana Gonzaga', 14, 'F'),
(1, 10, 'Maria Ramos', 40, 'F'),
(2, 10, 'Antonio Ramos', 38, 'M');

--Exames
INSERT INTO EXAME (CODIGO, NOME_EXAME, MATERIAL_COLHEITA, CLASSE_EXAME, SUBSTANCIAS_USADAS, METODO, PRAZO_EXAME, VALORES_REFERENCIA, NOTA, UNIDADE, CODIGO_MEDICO_ELABORADOR)
VALUES
(1, 'Eletrocardiograma', 'Eletrodos', 'Cardiologia', NULL, 'Eletrocardiografia', 2, 'Normal: 60-100bpm', NULL, 'bpm', 1),
(2, 'Ecocardiograma', 'Gel e Transdutor', 'Cardiologia', NULL, 'Ultrassonografia', 5, 'Normal: variável', NULL, 'N/A', 1),
(3, 'Exame de Sangue', 'Sangue', 'Hematologia', 'Anticoagulante', 'Análise Laboratorial', 1, 'Normal: variável', NULL, 'N/A', 2),
(4, 'Radiografia', 'Raio-X', 'Radiologia', NULL, 'Radiografia', 3, 'Normal: variável', NULL, 'N/A', 3),
(5, 'Ultrassonografia Obstétrica', 'Gel e Transdutor', 'Obstetrícia', NULL, 'Ultrassonografia', 5, 'Normal: variável', NULL, 'N/A', 4),
(6, 'Teste Cutâneo', 'Soluto e Agulha', 'Dermatologia', NULL, 'Teste Cutâneo', 2, 'Normal: N/A', NULL, 'N/A', 5),
(7, 'Biópsia de Pele', 'Bisturi', 'Dermatologia', 'Anestésico', 'Biópsia', 7, 'Normal: N/A', NULL, 'N/A', 5),
(8, 'Exame de Vista', 'Equipamento Oftalmológico', 'Oftalmologia', NULL, 'Exame Oftalmológico', 1, 'Normal: variável', NULL, 'N/A', 6),
(9, 'Ressonância Magnética', 'Equipamento de RM', 'Neurologia', NULL, 'Ressonância Magnética', 7, 'Normal: variável', NULL, 'N/A', 8),
(10, 'Tomografia Computadorizada', 'Equipamento de TC', 'Neurologia', NULL, 'Tomografia Computadorizada', 5, 'Normal: variável', NULL, 'N/A', 8),
(11, 'Exame de Urina', 'Urina', 'Urologia', 'Recipiente Estéril', 'Análise Laboratorial', 1, 'Normal: variável', NULL, 'N/A', 9),
(12, 'Biópsia de Mama', 'Agulha de Biópsia', 'Oncologia', 'Anestésico', 'Biópsia', 7, 'Normal: variável', NULL, 'N/A', 10);
