CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes;

CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,   
    nome_categoria VARCHAR(100) NOT NULL,          
    descricao_categoria VARCHAR (255)                       
);

INSERT INTO tb_categorias (nome_categoria, descricao_categoria)
VALUES
('Cortes Bovinos', 'Carnes provenientes de bovinos, como picanha, alcatra, etc.'),
('Cortes Suínos', 'Carnes provenientes de suínos, como lombo, costela, etc.'),
('Embutidos', 'Produtos como linguiças, salsichas e outros embutidos'),
('Aves', 'Carnes de frango e outras aves'),
('Carnes Exóticas', 'Produtos de carnes não convencionais, como cordeiro, javali, etc.');

SELECT * FROM tb_categorias;

CREATE TABLE tb_produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,     
    nome_produto VARCHAR(100) NOT NULL,            
    preco DECIMAL(10, 2) NOT NULL,                 
    quantidade_estoque INT NOT NULL,               
    data_validade DATE NOT NULL,                  
    carne_categoria INT NOT NULL,                     
    FOREIGN KEY (carne_categoria) REFERENCES tb_categorias(id_categoria)  
);

INSERT INTO tb_produtos (nome_produto, quantidade_estoque, preco, data_validade, carne_categoria)
VALUES
('Picanha', 50, 120.00, '2025-12-01', 1),
('Alcatra', 60, 90.00, '2025-11-15', 1),
('Costela Suína', 30, 70.00, '2025-09-10', 2),
('Linguiça Calabresa', 100, 25.00, '2025-07-20', 3),
('Frango Inteiro', 200, 15.00, '2025-08-05', 4),
('Cordeiro', 20, 180.00, '2025-11-25', 5),
('Lombo Suíno', 40, 85.00, '2025-10-15', 2),
('Peito de Frango', 150, 40.00, '2025-06-30', 4);

SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE preco > 100;

SELECT * FROM tb_produtos WHERE preco BETWEEN 70 AND 150;

SELECT * FROM tb_produtos WHERE nome_produto LIKE "%c%";

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.carne_categoria = tb_categorias.id_categoria;

-- EXIBIR EMBUTIDOS
SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.carne_categoria = tb_categorias.id_categoria
WHERE carne_categoria = 3;