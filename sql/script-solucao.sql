-- PACIENTES

-- Entidade regular Paciente
CREATE TABLE Pacientes (
    cpf VARCHAR2(11),
    sexo CHAR(1),
    nome VARCHAR2(255),
    email VARCHAR2(255),
    data_nascimento DATE,
    cep VARCHAR2(8),
    estado VARCHAR2(255),
    cidade VARCHAR2(255),
    bairro VARCHAR2(255),
    rua VARCHAR2(255),
    numero VARCHAR(5),

    CONSTRAINT pk_paciente_cpf
        PRIMARY KEY (cpf),
    CONSTRAINT ck_paciente_cpf
        CHECK(LENGTH(cpf) = 11),
    CONSTRAINT ck_paciente_sexo
        CHECK(sexo in ('M', 'F')),
    CONSTRAINT ck_paciente_cep
        CHECK(LENGTH(cep) = 8)
);

-- Atributo multivalorado Paciente(telefones)
CREATE TABLE Telefones_paciente (
    cpf_paciente VARCHAR2(11),
    telefone VARCHAR2(11),

    CONSTRAINT pk_fone_paciente
        PRIMARY KEY (cpf_paciente, telefone),
    CONSTRAINT fk_fone_paciente_cpf
        FOREIGN KEY (cpf_paciente)
        REFERENCES Pacientes(cpf)
        ON DELETE CASCADE,
    CONSTRAINT ck_fone_paciente
        CHECK(LENGTH(telefone) >= 10)
);

--MEDICOS

-- Superclasse Médicos
CREATE TABLE Medicos (
    codigo VARCHAR(255),
    cpf VARCHAR2(11),
    cnpj VARCHAR2(14),
    CRM_numero VARCHAR2(6),
    CRM_estado VARCHAR2(2),
    nome VARCHAR2(255),
    especialidade VARCHAR2(255),

    CONSTRAINT pk_medicos_codigo
        PRIMARY KEY (codigo),
    CONSTRAINT ck_medicos_cpf
        CHECK(LENGTH(cpf) = 11),
    CONSTRAINT ck_medicos_cnpj
        CHECK(LENGTH(cnpj) = 14),
    CONSTRAINT ck_medicos_crm_estado
        CHECK(LENGTH(CRM_estado) = 2)
);

-- Subclasse Médico Requisitante
CREATE TABLE Medico_requisitante (
    medico_cod VARCHAR2(255),
    rua VARCHAR2(255),
    bairro VARCHAR2(255),
    cidade VARCHAR2(255),
    estado VARCHAR2(255),
    cep VARCHAR2(8),

    CONSTRAINT pk_med_req_cod
        PRIMARY KEY (medico_cod),
    CONSTRAINT fk_med_req_cod
        FOREIGN KEY (medico_cod)
        REFERENCES Medicos(codigo)
        ON DELETE CASCADE,
    CONSTRAINT ck_med_req_cep
        CHECK(LENGTH(cep) = 8)
);

-- Atributo multivalorado Médico_Requisitante(telefones)
CREATE TABLE Telefones_medico_req (
    telefone VARCHAR2(11),
    cod_med_req VARCHAR2(255),

    CONSTRAINT pk_fone_med_req
        PRIMARY KEY (telefone, cod_med_req),
    CONSTRAINT fk_fone_med_req_cod
        FOREIGN KEY (cod_med_req)
        REFERENCES Medico_requisitante(medico_cod)
        ON DELETE CASCADE,
    CONSTRAINT ck_fone_med_req_fone
        CHECK(LENGTH(telefone) >= 10)
);

-- Subclasse Médico Elaborador
CREATE TABLE Medico_elaborador (
    medico_cod VARCHAR2(255),
    endereco VARCHAR2(255),
    telefone VARCHAR2(11),
    salario NUMERIC(10,2),
    carga_horaria INTEGER,
    data_admissao DATE,
    data_demissao DATE,

    CONSTRAINT pk_med_elab_cod
        PRIMARY KEY (medico_cod),
    CONSTRAINT fk_med_elab_cod
        FOREIGN KEY (medico_cod)
        REFERENCES Medicos(codigo)
        ON DELETE CASCADE,
    CONSTRAINT ck_med_elab_fone
        CHECK(LENGTH(telefone) >= 10),
    CONSTRAINT ck_med_elab_salario
        CHECK(salario >= 0),
    CONSTRAINT ck_med_elab_carga
        CHECK((carga_horaria > 0) AND (carga_horaria <= 168)),
    CONSTRAINT ck_med_elab_data_dem
        CHECK((data_demissao IS NULL) OR (data_demissao > data_admissao))
);

-- Entidade Fraca Dependentes (Entidade Forte: Médico Elaborador)
CREATE TABLE Dependentes (
    codigo VARCHAR2(255),
    cod_medico VARCHAR2(255),
    nome VARCHAR2(255),
    idade INTEGER,
    sexo CHAR(1),

    CONSTRAINT pk_depend_cod
        PRIMARY KEY (codigo, cod_medico),
    CONSTRAINT fk_depend_cod
        FOREIGN KEY (cod_medico)
        REFERENCES Medicos(codigo)
        ON DELETE CASCADE,
    CONSTRAINT ck_depend_idade
        CHECK((idade >= 0) AND (idade < 25)),
    CONSTRAINT ck_depend_sexo
        CHECK(sexo in ('M', 'F'))
);

-- CONVENIOS

-- Entidade Regular Convênio
CREATE TABLE Convenio (
    codigo_ANS VARCHAR2(6),
    codigo_da_operadora VARCHAR2(255),
    cnpj VARCHAR2(14),
    nome VARCHAR2(255),
    endereco VARCHAR2(255),
    email VARCHAR2(255),
    
    CONSTRAINT pk_conv_cod
        PRIMARY KEY (codigo_ANS),
    CONSTRAINT ck_conv_cnpj
        CHECK(LENGTH(cnpj) = 14),
    CONSTRAINT ck_conv_ans
        CHECK(LENGTH(codigo_ANS) = 6)
);

-- Atributo multivalorado Convênio(telefones)
CREATE TABLE Telefones_convenio (
    telefone VARCHAR2(11),
    conv_codigo_ANS VARCHAR2(6),

    CONSTRAINT pk_fone_convenio_cod
        PRIMARY KEY (telefone, conv_codigo_ANS),
    CONSTRAINT fk_fone_convenio_cod
        FOREIGN KEY (conv_codigo_ANS)
        REFERENCES Convenio(codigo_ANS)
        ON DELETE CASCADE,
    CONSTRAINT ck_fone_convenio CHECK(LENGTH(telefone) >= 10)
);

-- Relacionamento "Atende" entre Médico e Convênio
CREATE TABLE Medicos_convenio (
    cod_convenio VARCHAR2(6),
    cod_medico VARCHAR2(255),

    CONSTRAINT pk_med_conv_cod
        PRIMARY KEY (cod_convenio, cod_medico),
    CONSTRAINT fk_med_conv_cod
        FOREIGN KEY (cod_medico)
        REFERENCES Medicos(codigo)
        ON DELETE CASCADE,
    CONSTRAINT ck_med_conv_ans
        FOREIGN KEY (cod_convenio)
        REFERENCES Convenio(codigo_ANS)
        ON DELETE CASCADE
);

-- Relacionamento "Contrata" entre Paciente e Convênio
CREATE TABLE Contratos_pac_conv (
    cpf_paciente VARCHAR2(11),
    cod_ANS_convenio VARCHAR2(6),
    data_expiracao DATE,
    numero INTEGER,

    CONSTRAINT pk_cont_cpf_ans
        PRIMARY KEY(cpf_paciente, cod_ANS_convenio),
    CONSTRAINT fk_cont_ans
        FOREIGN KEY (cod_ANS_convenio)
        REFERENCES Convenio(codigo_ANS)
        ON DELETE CASCADE,
    CONSTRAINT fk_cont_cpf
        FOREIGN KEY (cpf_paciente)
        REFERENCES Pacientes(cpf)
        ON DELETE CASCADE,
    CONSTRAINT ck_cont_num
        CHECK(numero >= 0)
);

-- EXAMES

-- Entidade regular Exames
CREATE TABLE Exames (
    codigo_exame VARCHAR2(255),
    cod_med_req VARCHAR2(255),
    cod_med_elab VARCHAR2(255),
    classe_exame VARCHAR2(255),
    material_coleta VARCHAR2(255),
    metodo VARCHAR2(255),
    nome_exame VARCHAR2(255),
    nota VARCHAR2(255),
    prazo_exame DATE,
    substancias_usadas VARCHAR2(255),
    unidade VARCHAR2(255),
    valores_de_referencia VARCHAR2(255),

    CONSTRAINT pk_exam_cod
        PRIMARY KEY (codigo_exame),
    CONSTRAINT fk_exam_cod_med_req
        FOREIGN KEY (cod_med_req)
        REFERENCES Medico_requisitante(medico_cod),
    CONSTRAINT fk_exam_cod_med_elab
        FOREIGN KEY (cod_med_elab)
        REFERENCES Medico_elaborador(medico_cod)
);

-- Relacionamento "Provê" entre Convênio e Exame
CREATE TABLE Exames_convenio (
    cod_exame VARCHAR2(255),
    cod_convenio VARCHAR2(6),
    preco NUMERIC(10,2),

    CONSTRAINT pk_exam_conv_cod
        PRIMARY KEY(cod_exame, cod_convenio),
    CONSTRAINT fk_exam_conv_cod
        FOREIGN KEY (cod_exame)
        REFERENCES Exames(codigo_exame)
        ON DELETE CASCADE,
    CONSTRAINT fk_exam_conv_ans
        FOREIGN KEY (cod_convenio)
        REFERENCES Convenio(codigo_ANS)
        ON DELETE CASCADE,
    CONSTRAINT ck_exam_conv_preco
        CHECK(preco >= 0)
);

-- ATENDIMENTOS

-- Entidade Regular Atendimentos
CREATE TABLE Atendimentos (
    codigo VARCHAR2(255),
    paciente_cpf VARCHAR2(11),
    cod_med VARCHAR2(6),
    cod_convenio VARCHAR2(6),
    data_atendimento DATE,
    hora INTERVAL DAY TO SECOND,

    CONSTRAINT pk_atend_cod
        PRIMARY KEY (codigo),
    CONSTRAINT fk_atend_cpf
        FOREIGN KEY (paciente_cpf)
        REFERENCES Pacientes(cpf)
        ON DELETE CASCADE,
    CONSTRAINT fk_atend_cod_med
        FOREIGN KEY (cod_med)
        REFERENCES Medico_requisitante(medico_cod)
        ON DELETE CASCADE,
    CONSTRAINT fk_atend_ans
        FOREIGN KEY (cod_convenio)
        REFERENCES Convenio(codigo_ANS)
        ON DELETE CASCADE
);

-- Relacionamento "Requere" entre Atendimento e Exame
CREATE TABLE Requerimentos (
    cod_atendimento VARCHAR2(255),
    cod_exame VARCHAR2(255),
    timestamp_coleta timestamp,
    timestamp_liberacao timestamp,
    resultado VARCHAR2(255),
    preco NUMERIC(10,2),

    CONSTRAINT pk_req_cod_atend_exam
        PRIMARY KEY (cod_atendimento, cod_exame),
    CONSTRAINT fk_req_cod_exam
        FOREIGN KEY (cod_exame)
        REFERENCES Exames(codigo_exame)
        ON DELETE CASCADE,
    CONSTRAINT fk_req_cod_atend
        FOREIGN KEY (cod_atendimento)
        REFERENCES Atendimentos(codigo)
        ON DELETE CASCADE,
    CONSTRAINT ck_req_preco
        CHECK(preco >= 0),
    CONSTRAINT ck_req_time_lib
        CHECK((timestamp_liberacao is NULL)
            OR (timestamp_liberacao >= timestamp_coleta))
);

-- FORMAS DE PAGAMENTO

-- Entidade regular "Formas de Pagamento"
CREATE TABLE Formas_de_pagamento (
    id_forma_pagamento VARCHAR2(255),
    forma VARCHAR2(255) NOT NULL UNIQUE,

    CONSTRAINT pk_forma_id
        PRIMARY KEY (id_forma_pagamento)
);

-- Relacionamento "está" entre Formas de Pagamento e Atendimento
CREATE TABLE Pagamentos (
    id_forma VARCHAR2(255),
    cod_atendimento VARCHAR2(255),
    valor NUMERIC(10,2),

    CONSTRAINT pk_pag_id_forma_cod_atend
        PRIMARY KEY (id_forma, cod_atendimento),
    CONSTRAINT fk_pag_id_forma
        FOREIGN KEY (id_forma)
        REFERENCES Formas_de_pagamento(id_forma_pagamento)
        ON DELETE CASCADE,
    CONSTRAINT fk_pag_cod_atend
        FOREIGN KEY (cod_atendimento)
        REFERENCES Atendimentos(codigo)
        ON DELETE CASCADE,
    CONSTRAINT ck_pag_valor
        CHECK(valor >= 0)
);