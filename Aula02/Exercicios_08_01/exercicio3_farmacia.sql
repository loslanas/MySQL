
CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY, 
    nome_categoria VARCHAR(100) NOT NULL,        
    descricao_categoria varchar(255)                     
);

INSERT INTO tb_categorias (nome_categoria, descricao_categoria)
VALUES
('Medicamentos', 'Medicamentos e remédios para tratamentos diversos'),
('Higiene', 'Produtos de higiene pessoal, como sabonetes, shampoos e cremes'),
('Beleza', 'Produtos de beleza e cosméticos, como maquiagens e perfumes'),
('Suplementos', 'Suplementos alimentares e vitaminas'),
('Saúde', 'Produtos voltados para o cuidado com a saúde, como termômetros e faixas');

SELECT * FROM tb_categorias;

CREATE TABLE tb_produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,   
    nome_produto VARCHAR(100) NOT NULL,          
    preco DECIMAL(10, 2) NOT NULL,               
    quantidade_estoque INT NOT NULL,             
    data_validade DATE,                          
    produto_categoria INT NOT NULL,                   
    FOREIGN KEY (produto_categoria) REFERENCES tb_categorias(id_categoria) 
);

INSERT INTO tb_produtos (nome_produto, preco, quantidade_estoque, data_validade, produto_categoria)
VALUES
('Dipirona', 12.50, 150, '2025-12-01', 1), 
('Paracetamol', 9.99, 200, '2025-11-10', 1),
('Sabonete Líquido', 5.90, 300, '2026-01-01', 2), 
('Shampoo Anticaspa', 18.50, 100, '2026-05-01', 2), 
('Perfume Feminino', 120.00, 50, '2027-02-15', 3), 
('Base de Maquiagem', 60.00, 80, '2026-08-01', 3), 
('Creatina', 75.00, 120, '2026-11-01', 4), 
('Multivitamínico', 105.00, 60, '2027-04-25', 4); 

SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE preco > 50;

SELECT * FROM tb_produtos WHERE preco BETWEEN 5 AND 60;

SELECT * FROM tb_produtos WHERE nome_produto LIKE "%c%";

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.produto_categoria = tb_categorias.id_categoria;

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.produto_categoria = tb_categorias.id_categoria
WHERE produto_categoria = 4;