-- Database: parkbase

-- DROP DATABASE IF EXISTS parkbase;

CREATE DATABASE parkbase
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
	
	
--	--	--	--	--	--	--	--	TABELAS

CREATE TABLE clientes (
	id		 	SERIAL NOT NULL,
	nome		VARCHAR(250) NOT NULL,
	cpf			VARCHAR(250),
	dt_inicio 	timestamp NOT NULL,
	convenio 	INT,
	endereco 	INT,
	
	PRIMARY KEY (id)
);

CREATE TABLE conveniados (
	id			SERIAL NOT NULL,
	nome		VARCHAR(250) NOT NULL,
	cnpj		VARCHAR(250) NOT NULL,
	dt_inicio	timestamp NOT NULL,
	status		BOOLEAN NOT NULL,
	desconto_termo	INT,
	endereco	INT,
	frota		INT,
	
	PRIMARY KEY(id)
);

CREATE TABLE termo_descontos (
	id			SERIAL NOT NULL,
	nome		VARCHAR(250),
	obs			VARCHAR(250),
	ult_alteracao	timestamp NOT NULL,
	dt_cad		timestamp NOT NULL,
	base_calc	varchar(500),
	
	PRIMARY KEY(id)
);

CREATE TABLE enderecos (
	id			SERIAL NOT NULL,
	cidade		INT NOT NULL,
	numero		VARCHAR(250),
	cep			VARCHAR(250),
	
	PRIMARY KEY(id)
);

CREATE TABLE cidades (
	id			SERIAL NOT NULL,
	nome		VARCHAR(250),
	estado		INT NOT NULL,

	PRIMARY KEY(id)
);

CREATE TABLE estados (
	id			SERIAL NOT NULL,
	nome		VARCHAR(250),

	PRIMARY KEY(id)
);

CREATE TABLE placa_clientes (
	id			SERIAL NOT NULL,
	status		BOOLEAN NOT NULL,
	conteudo	VARCHAR(250) NOT NULL,
	cliente		INT NOT NULL,
	veiculo		INT NOT NULL,

	PRIMARY KEY(id)
);

CREATE TABLE frotas (
	id			SERIAL NOT NULL,
	nome		VARCHAR(250),
	dt_cad		timestamp NOT NULL,

	PRIMARY KEY(id)
);

CREATE TABLE veiculos (
	id			SERIAL NOT NULL,
	nome		VARCHAR(250),
	tp_veiculo	INT NOT NULL,
	cor			INT NOT NULL,
	marca		INT NOT NULL,
	modelo		INT NOT NULL,
	frota		INT,
	dt_cad		timestamp NOT NULL,

	PRIMARY KEY(id)
);

CREATE TABLE tp_veiculo (
	id			SERIAL NOT NULL,
	nome		VARCHAR(250),

	PRIMARY KEY(id)
);

CREATE TABLE cor (
	id			SERIAL NOT NULL,
	nome		VARCHAR(250),

	PRIMARY KEY(id)
);

CREATE TABLE marca (
	id			SERIAL NOT NULL,
	nome		VARCHAR(250),

	PRIMARY KEY(id)
);

CREATE TABLE modelo (
	id			SERIAL NOT NULL,
	nome		VARCHAR(250),
	ano			VARCHAR(250),

	PRIMARY KEY(id)
);

--	--	--	--	TABELAS ESTRANGEIRAS

ALTER TABLE clientes
	ADD CONSTRAINT conveniados_fk
		FOREIGN KEY (id) 
			REFERENCES conveniados (id);
			
ALTER TABLE clientes
	DROP COLUMN endereco;
	
ALTER TABLE enderecos
	ADD COLUMN cliente INT NOT NULL;
	

			
select * from clientes;