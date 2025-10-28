-- ============================================================
-- Projeto: Bella Make - Análise de Vendas
-- Etapa: 01 - Criação das tabelas
-- Autor: Lucas Martins
-- ============================================================

CREATE DATABASE bellamake;

USE bellamake;
CREATE TABLE vendas (
	id_vendas INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
	valor_vendas DECIMAL(10,2) NOT NULL,
	data_venda DATE NOT NULL,
	PRIMARY KEY (id_vendas),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor (id_vendedor));
    
CREATE TABLE produtos (
	id_produto INT NOT NULL AUTO_INCREMENT,
    produtos VARCHAR (255) NOT NULL,
    valor_produto DECIMAL(10,2) NOT NULL, 
    PRIMARY KEY (id_produto));
    
CREATE TABLE cliente (
	id_cliente INT NOT NULL AUTO_INCREMENT,
    nome_cliente VARCHAR (255) NOT NULL,
    sobrenome_cliente VARCHAR (255) NOT NULL,
	id_pais INT NOT NULL,
    PRIMARY KEY (id_cliente),
    FOREIGN KEY (id_pais) REFERENCES paises (id_pais));
    
CREATE TABLE vendedor (
	id_vendedor INT NOT NULL AUTO_INCREMENT,
    nome_vendedor VARCHAR (255) NOT NULL,
    sobrenome_vendedor VARCHAR (255) NOT NULL,
    PRIMARY KEY (id_vendedor));
    
CREATE TABLE paises (
	id_pais INT NOT NULL AUTO_INCREMENT,
    nome_pais VARCHAR (255),
    PRIMARY KEY (id_pais));
    
CREATE TABLE itens_venda(
    id_item INT NOT NULL AUTO_INCREMENT,
    id_vendas INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_item),
    FOREIGN KEY (id_vendas) REFERENCES vendas(id_vendas),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto));

-- ============================================================
-- Etapa: 02 - Inserção de dados
-- ============================================================
    
INSERT INTO cliente (nome_cliente, sobrenome_cliente, id_pais)
VALUES 
	('Luana', 'Novaes', 1),
    ('Isaac' ,'Jesus', 2),
    ('Isadora', 'da Cunha', 3),
    ('Evelyn', 'Castro', 4),
    ('Maitê', 'Gomes', 4),
    ('Bernardo', 'Rezende', 2),
    ('Cauê', 'Castro', 1),
    ('Erick', 'Oliveira', 5),
    ('João Guilherme', 'Porto', 4),
    ('André', 'Almeida', 3),
    ('Natália', 'da Cruz', 5),
    ('Alexia', 'Azevedo', 4),
    ('Luiz', 'Henrique Pires', 4),
    ('João Guilherme', 'Caldeira', 4),
    ('Helena', 'Almeida', 3);
INSERT INTO vendas (id_cliente, id_vendedor, valor_vendas, data_venda)
VALUES 
	(1, 1, 159.90, '2025-01-02'),
    (2, 2, 39.90, '2025-01-05'),
    (3, 3, 179.70, '2025-01-07'),
    (4, 4, 129.90, '2025-01-09'),
    (5, 5, 90.00, '2025-01-11'),
    (6, 6, 35.90, '2025-01-13'),
    (7, 7, 199.60, '2025-01-15'),
    (8, 1, 110.00, '2025-01-18'),
    (9, 2, 89.90, '2025-01-20'),
    (10, 3, 89.70, '2025-01-22'),
    (11, 4, 79.90, '2025-02-25'),
    (12, 5, 79.80, '2025-02-27'),
    (13, 6, 59.90, '2025-03-02'),
    (14, 7, 259.80, '2025-03-04'),
    (15, 1, 45.00, '2025-03-06'),
    (1, 2, 107.70, '2025-03-08'),
    (2, 3, 199.60, '2025-03-10'),
    (3, 4, 110.00, '2025-03-12'),
    (4, 5, 89.90, '2025-03-15'),
    (5, 6, 149.50, '2025-03-18'),
    (6, 7, 159.80, '2025-04-20'),
    (7, 1, 39.90, '2025-04-22'),
    (8, 2, 179.70, '2025-04-25'),
    (9, 3, 129.90, '2025-04-27'),
    (10, 4, 90.00, '2025-04-29'),
    (11, 5, 35.90, '2025-05-01'),
    (12, 6, 199.60, '2025-05-03'),
    (13, 7, 110.00, '2025-05-05'),
    (14, 1, 89.90, '2025-05-07'),
    (15, 2, 89.70, '2025-05-09'),
    (1, 3, 79.90, '2025-06-11'),
    (2, 4, 79.80, '2025-06-13'),
    (3, 5, 59.90, '2025-06-15'),
	(4, 6, 259.80, '2025-06-17'),
    (5, 7, 45.00, '2025-06-19'),
    (6, 1, 107.70, '2025-06-21'),
    (7, 2, 99.80, '2025-06-23'),
    (8, 3, 55.00, '2025-06-25'),
    (9, 4, 449.50, '2025-06-27'),
    (10, 5, 59.80, '2025-06-30');
INSERT INTO produtos (produtos, valor_produto)
VALUES 
	('Base Líquida', 79.90),
	('Batom Matte', 39.90),
	('Máscara de Cílio', 59.90),
	('Paleta de Sombras', 129.90),
	('Pó Compacto', 45.00),
	('Delineador Líquido', 35.90),
	('Blush Compacto', 49.90),
	('Corretivo Líquido', 55.00),
	('Iluminador', 89.90),
	('Gloss Labial', 29.90);
INSERT INTO paises (nome_pais)
VALUES
	('Brasil'),
    ('Peru'),
    ('Chile'),
    ('Colômbia'),
    ('Argentina');
INSERT INTO vendedor (nome_vendedor, sobrenome_vendedor)
VALUES 
	('Pedro Henrique', 'Moreira'),
    ('Sarah', 'Ramos'),
    ('Cecília', 'Pinto'),
    ('Samuel', 'Araújo'),
    ('Alice', 'Rezende'),
    ('Luigi', 'Ferreira'),
    ('Juan', 'Fogaça');
INSERT INTO itens_venda(id_vendas, id_produto, quantidade, preco_unitario)
VALUES 
	(1 , 1, 2, 79.90),
    (2, 2, 1, 39.90),
    (3, 3, 3, 59.90),
    (4, 4, 1, 129.90),
    (5, 5, 2, 45.00),
    (6, 6, 1, 35.90),
    (7, 7, 4, 49.90),
    (8, 8, 2, 55.00),
    (9, 9, 1, 89.90),
    (10, 10, 3, 29.90),
    (11, 1, 1, 79.90),
    (12, 2, 1, 39.90),
    (13, 3, 2, 59.90),
    (14, 4, 2, 129.90),
    (15, 5, 1, 45.00),
    (16, 6, 3, 35.90),
    (17, 7, 4, 49.90),
    (18, 8, 2, 55.00),
    (19, 9, 1, 89.90),
    (20, 10, 5, 29.90),
    (21, 1, 2, 79.90),
    (22, 2, 1, 39.90),
    (23, 3, 3, 59.90),
    (24, 4, 1, 129.90),
    (25, 5, 2, 45.00),
    (26, 6, 1, 35.90),
    (27, 7, 4, 49.90),
    (28, 8, 2, 55.00),
    (29, 9, 1, 89.90),
    (30, 10, 3, 29.90),
    (31, 1, 1, 79.90),
    (32, 2, 2, 39.90),
    (33, 3, 1, 59.90),
    (34, 4, 2, 129.90),
    (35, 5, 1, 45.00),
    (36, 6, 3, 35.90),
    (37, 7, 2, 49.90),
    (38, 8, 1, 55.00),
    (39, 9, 5, 89.90),
    (40, 10, 2, 29.90);