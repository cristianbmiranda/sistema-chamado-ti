CREATE DATABASE SistemaChamadosTI;
USE SistemaChamadosTI;

CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    setor VARCHAR(50)
);

CREATE TABLE Tecnicos (
    id_tecnico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    especialidade VARCHAR(50)
);

CREATE TABLE Chamados (
    id_chamado INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_tecnico INT,
    titulo VARCHAR(100),
    descricao TEXT,
    data_abertura DATE,
    data_fechamento DATE,
    status ENUM('Aberto', 'Em andamento', 'Fechado'),
    solucao TEXT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_tecnico) REFERENCES Tecnicos(id_tecnico)
);
