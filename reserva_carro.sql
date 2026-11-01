
CREATE DATABASE reserva_carro;

USE reserva_carro;

CREATE TABLE sede (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    nome_gerente VARCHAR(50) NOT NULL,
    multa DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE classes_carro (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    valor_diaria DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE clientes (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    cnh VARCHAR(20) NOT NULL,
    validade_cnh DATE NOT NULL,
    categoria_cnh VARCHAR(3) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE carros (
    id INT NOT NULL AUTO_INCREMENT,
    placa VARCHAR(10) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    cor VARCHAR(20) NOT NULL,
    quilometragem DECIMAL(8,2) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    situacao VARCHAR(30) NOT NULL,
    origem_carro INT NOT NULL,
    local_carro INT,
    classe_carro INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (origem_carro) REFERENCES sede (id),
    FOREIGN KEY (local_carro) REFERENCES sede (id),
    FOREIGN KEY (classe_carro) REFERENCES classes_carro (id)
);

CREATE TABLE reservas (
    numero INT NOT NULL AUTO_INCREMENT,
    diarias INT NOT NULL,
    data_locacao DATE NOT NULL,
    data_retorno DATE,
    quilometros_rodados DECIMAL(8,2),
    multa DECIMAL(8,2),
    situacao VARCHAR(20) NOT NULL,
    total DECIMAL(8,2),
    carro_reserva INT NOT NULL,
    cliente_reserva INT NOT NULL,
    sede_locacao INT NOT NULL,
    sede_devolucao INT NOT NULL,
    PRIMARY KEY (numero),
    FOREIGN KEY (carro_reserva) REFERENCES carros (id),
    FOREIGN KEY (cliente_reserva) REFERENCES clientes (id),
    FOREIGN KEY (sede_locacao) REFERENCES sede (id),
    FOREIGN KEY (sede_devolucao) REFERENCES sede (id)
);
