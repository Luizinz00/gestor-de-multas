CREATE DATABASE IF NOT EXISTS gestor_multas;
USE gestor_multas;

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf_cnpj VARCHAR(18) NOT NULL UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(20),
    tipo_cliente ENUM('FISICA', 'JURIDICA') NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE veiculo (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    placa VARCHAR(10) NOT NULL UNIQUE,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    ano INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);
CREATE TABLE multa (
    id_multa INT PRIMARY KEY AUTO_INCREMENT,
    id_veiculo INT NOT NULL,
    tipo_infracao VARCHAR(100),
    descricao TEXT,
    data_infracao DATE,
    valor DECIMAL(10,2),
    orgao_autuador VARCHAR(100),
    status ENUM('PENDENTE', 'PAGO', 'RECORRENDO') DEFAULT 'PENDENTE',
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
);
CREATE TABLE pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_multa INT NOT NULL,
    forma_pagamento ENUM('PIX', 'BOLETO', 'CARTAO', 'DINHEIRO'),
    data_pagamento DATE,
    valor_pago DECIMAL(10,2),
    observacoes TEXT,
    FOREIGN KEY (id_multa) REFERENCES multa(id_multa)
);
CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    senha_hash VARCHAR(255),
    tipo ENUM('ADMIN', 'ATENDENTE') DEFAULT 'ATENDENTE'
);

INSERT INTO cliente (nome, cpf_cnpj, email, telefone, tipo_cliente)
VALUES 
('João Silva', '123.456.789-00', 'joao@email.com', '(98) 98111-1111', 'FISICA'),
('Auto Peças Maranhão LTDA', '12.345.678/0001-99', 'contato@automa.com', '(98) 98222-2222', 'JURIDICA'),
('Maria Souza', '987.654.321-00', 'maria@email.com', '(98) 98333-3333', 'FISICA');

INSERT INTO veiculo (id_cliente, placa, marca, modelo, ano)
VALUES
(1, 'ABC1D23', 'Volkswagen', 'Jetta', 2025),
(1, 'XYZ2E34', 'Chevrolet', 'Onix', 2020),
(2, 'MAR3F45', 'Volkswagen', 'Nivus', 2022),
(3, 'SOU4G56', 'Toyota', 'Corolla', 2021),
(3, 'ZXC5H67', 'Honda', 'Civic', 2017);

INSERT INTO multa (id_veiculo, tipo_infracao, descricao, data_infracao, valor, orgao_autuador, status)
VALUES
(1, 'Excesso de velocidade', 'Ultrapassou o limite de 60km/h', '2024-12-15', 195.23, 'DETRAN-MA', 'PENDENTE'),
(1, 'Estacionamento proibido', 'Veículo parado em local de carga e descarga', '2025-01-03', 130.00, 'SMTT', 'PAGO'),
(2, 'Avanço de sinal vermelho', 'Desrespeito ao semáforo', '2025-02-21', 293.47, 'DETRAN-MA', 'RECORRENDO'),
(3, 'Falta de cinto', 'Condutor sem cinto de segurança', '2025-03-10', 195.23, 'SMTT', 'PENDENTE'),
(3, 'Licenciamento vencido', 'Veículo sem licenciamento válido', '2025-03-15', 293.47, 'DETRAN-MA', 'PENDENTE'),
(4, 'Excesso de velocidade', 'Acima de 80km/h', '2025-04-01', 195.23, 'DETRAN-MA', 'PAGO'),
(4, 'Estacionamento irregular', 'Obstrução de garagem', '2025-04-22', 130.00, 'SMTT', 'PENDENTE'),
(5, 'Falta de capacete', 'Condutor de moto sem capacete', '2025-05-03', 293.47, 'DETRAN-MA', 'RECORRENDO'),
(5, 'Uso de celular', 'Uso de celular ao volante', '2025-05-10', 130.00, 'SMTT', 'PAGO'),
(2, 'Estacionamento sobre faixa', 'Veículo parado sobre faixa de pedestre', '2025-06-05', 195.23, 'SMTT', 'PENDENTE');