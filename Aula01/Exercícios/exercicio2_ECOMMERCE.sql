CREATE DATABASE db_ecommerce;
USE db_ecommerce;
CREATE TABLE tb_produtos
(
	id_produto bigint auto_increment PRIMARY KEY,
    nome_produto varchar(255) NOT NULL,
    categoria varchar(255) NOT NULL,
    descricao varchar(500),
    marca varchar(255) NOT NULL,
    estoque int,
    preco decimal(10,2) NOT NULL

);

INSERT INTO tb_produtos (nome_produto, categoria, descricao, marca, estoque, preco) 
VALUES
('Bermuda', 'Roupas', 'Bermuda preta','Adidas', 25, 112.90),
('TV OLED','Eletrônicos', 'TV OLED 60 polegadas','LG', 35, 6500.00),
('Switch 2','Videogames','Video Game híbrido','Nintendo', 64, 3500.00),
('Tênis Esportivo',"Calçados", 'Tênis para corrida', 'Nike', 84, 299.90),
('Fogão','Eletrodomésticos','Fogão 6 bocas', 'Brastemp', 35, 2500.00),
('Monitor','Eletrônicos','Monitor 28 polegadas 240hz','Samsung', 45, 6500.00),
('Meia','Roupas','Meia Branca','Lupo', 250, 8.00),
('Copo Térmico','Recipientes Térmicos', 'Copo térmico de 1 litro', 'Kevin', 65, 500.00);


SELECT * from tb_produtos;
SELECT * FROM tb_produtos WHERE preco >= 500;
SELECT * FROM tb_produtos WHERE preco < 500;

UPDATE tb_produtos SET preco = 80.00, descricao = "Copo térmico de 450 ml" WHERE id_produto = 8;
SELECT * from tb_produtos;


