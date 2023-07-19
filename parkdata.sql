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
--	CONVENIADOS
ALTER TABLE clientes
	ADD CONSTRAINT conveniados_fk
		FOREIGN KEY (convenio) 
			REFERENCES conveniados (id);

ALTER TABLE termo_descontos
	ADD CONSTRAINT conveniados_fk
		FOREIGN KEY (convenio) 
			REFERENCES conveniados (id);
			
ALTER TABLE frotas
	ADD CONSTRAINT conveniados_fk
		FOREIGN KEY (convenio) 
			REFERENCES conveniados (id);
			
ALTER TABLE enderecos
	ADD CONSTRAINT conveniados_fk
		FOREIGN KEY (conveniado) 
			REFERENCES conveniados (id);
			
--	CLIENTE			
ALTER TABLE placa_clientes
	ADD CONSTRAINT clientes_fk
		FOREIGN KEY (cliente) 
			REFERENCES clientes (id);
			
ALTER TABLE enderecos
	ADD CONSTRAINT clientes_fk
		FOREIGN KEY (cliente) 
			REFERENCES clientes (id);
			
--	ENDERECOS
ALTER TABLE enderecos
	ADD CONSTRAINT cidade_fk
		FOREIGN KEY (cidade) 
			REFERENCES cidades (id);
			
ALTER TABLE cidades
	ADD CONSTRAINT estados_fk
		FOREIGN KEY (estado) 
			REFERENCES estados (id);
			
--	VEICULOS/PLACAS/ETC
ALTER TABLE placa_clientes
	ADD CONSTRAINT veiculos_fk
		FOREIGN KEY (veiculo) 
			REFERENCES veiculos (id);

ALTER TABLE veiculos
	ADD CONSTRAINT tp_veiculo_fk
		FOREIGN KEY (tp_veiculo) 
			REFERENCES tp_veiculo (id);

ALTER TABLE veiculos
	ADD CONSTRAINT cor_fk
		FOREIGN KEY (cor) 
			REFERENCES cor (id);
			
ALTER TABLE veiculos
	ADD CONSTRAINT marca_fk
		FOREIGN KEY (marca) 
			REFERENCES marca (id);
			
ALTER TABLE veiculos
	ADD CONSTRAINT modelo_fk
		FOREIGN KEY (modelo) 
			REFERENCES modelo (id);
			
ALTER TABLE veiculos
	ADD CONSTRAINT frota_fk
		FOREIGN KEY (frota) 
			REFERENCES frotas (id);
			
select * from tp_veiculo;