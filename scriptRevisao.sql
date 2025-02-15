use revisao;

-- Exemplo de relação de um para muitos
DROP TABLE IF EXISTS clientes;
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS pedidos;
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    descricao VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Inserção nas tabelas 
INSERT INTO clientes (nome, email) VALUES ('Puff daddy', 'puffy@gmail.com');
INSERT INTO clientes (nome, email) VALUES ('Aubrey', 'drake@gmail.com');
INSERT INTO clientes (nome, email) VALUES ('Jorgin', 'jorgin@gmail.com');

INSERT INTO pedidos (id_cliente, descricao) VALUES (1, 'Caneta azul');
INSERT INTO pedidos (id_cliente, descricao) VALUES (1, 'Borracha');
INSERT INTO pedidos (id_cliente, descricao) VALUES (2, 'Lapiseira');
INSERT INTO pedidos (id_cliente, descricao) VALUES (2, 'Borracha');
INSERT INTO pedidos (id_cliente, descricao) VALUES (2, 'Estojo');
INSERT INTO pedidos (id_cliente, descricao) VALUES (3, 'Lapiseira');


-- Exemplo de relação muitos para muitos
DROP TABLE IF EXISTS alunos;
CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS cursos;
CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    ativa BOOLEAN NOT NULL
);

DROP TABLE IF EXISTS matriculas;
CREATE TABLE matriculas (
    id_aluno INT,
    id_curso INT,
    PRIMARY KEY (id_aluno, id_curso),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

INSERT INTO alunos(nome, idade, email, senha) VALUES ('Jayson', 27, 'tatumzinho@outlook.com', 'deuce123');
INSERT INTO alunos(nome, idade, email, senha) VALUES ('Luka', 26, 'lukinha@gmail.com', 'gabrielazinha123');
INSERT INTO alunos(nome, idade, email, senha) VALUES ('Neymar', 34, 'neymarzinho@gmail.com', 'maviezinha321');

INSERT INTO cursos(nome, ativa) VALUES ('Basquete', 1);
INSERT INTO cursos(nome, ativa) VALUES ('Futebol', 1);

INSERT INTO matriculas (id_aluno, id_curso) VALUES (1, 2);
INSERT INTO matriculas (id_aluno, id_curso) VALUES (1, 1);
INSERT INTO matriculas (id_aluno, id_curso) VALUES (2, 2);
INSERT INTO matriculas (id_aluno, id_curso) VALUES (3, 1);
INSERT INTO matriculas (id_aluno, id_curso) VALUES (3, 2);

