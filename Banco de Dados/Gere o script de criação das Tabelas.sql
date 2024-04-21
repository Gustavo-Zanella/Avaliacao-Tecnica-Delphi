--Schema
CREATE SCHEMA taif;

--Carro
CREATE TABLE taif.tbcarro (
	carcodigo SERIAL NOT NULL,
	carmodelo VARCHAR(255) NOT NULL,
	cardatalancamento DATE NOT NULL,
	CONSTRAINT pk_tbcarro PRIMARY KEY (carcodigo)
);
COMMENT ON COLUMN taif.tbcarro.carcodigo IS 'Código do Carro';
COMMENT ON COLUMN taif.tbcarro.carmodelo IS 'Modelo do Carro';
COMMENT ON COLUMN taif.tbcarro.cardatalancamento IS 'Data de Lançamento do Modelo do Carro';

--Cliente
CREATE TABLE taif.tbcliente (
	clicodigo SERIAL NOT NULL,
	clinome VARCHAR(255) NOT NULL,
	clicpf VARCHAR(14) NOT NULL,
	clidatanascimento DATE NOT NULL,
	CONSTRAINT pk_tbcliente PRIMARY KEY (clicodigo)
);
COMMENT ON COLUMN taif.tbcliente.clicodigo IS 'Código do Cliente';
COMMENT ON COLUMN taif.tbcliente.clinome IS 'Nome do Cliente';
COMMENT ON COLUMN taif.tbcliente.clicpf IS 'Cpf do Cliente';
COMMENT ON COLUMN taif.tbcliente.clidatanascimento IS 'Data de Nascimento';

--Venda
CREATE TABLE taif.tbvenda (
	vencodigo SERIAL NOT NULL,
	vendata DATE NOT NULL,
	clicodigo BIGINT NOT NULL,
	carcodigo INTEGER NOT NULL,
	CONSTRAINT pk_tbvenda PRIMARY KEY (vencodigo), 
	CONSTRAINT tbcarro_tbvenda_fk FOREIGN KEY (carcodigo)
	REFERENCES taif.tbcarro (carcodigo),
	CONSTRAINT tbcliente_tbvenda_fk FOREIGN KEY (clicodigo)
	REFERENCES taif.tbcliente (clicodigo)
);
COMMENT ON COLUMN taif.tbvenda.vencodigo IS 'Código da Venda';
COMMENT ON COLUMN taif.tbvenda.vendata IS 'Data da Venda';
COMMENT ON COLUMN taif.tbvenda.clicodigo IS 'Código do Cliente';
COMMENT ON COLUMN taif.tbvenda.carcodigo IS 'Código do Carro';