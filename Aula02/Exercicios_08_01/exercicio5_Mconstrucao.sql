
CREATE DATABASE db_construindo_vidas;

USE db_construindo_vidas;

CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL,
    descricao_categoria VARCHAR (255)
);

INSERT INTO tb_categorias (nome_categoria, descricao_categoria)
VALUES
('Ferramentas', 'Ferramentas manuais e elétricas para construção'),
('Materiais de Acabamento', 'Produtos para acabamento como tintas, pisos, revestimentos'),
('Materiais de Construção', 'Blocos, cimento, areia, e outros materiais básicos de construção'),
('Elétricos', 'Fios, cabos, lâmpadas e outros materiais elétricos'),
('Hidráulicos', 'Tubos, conexões e outros materiais para instalações hidráulicas');

SELECT * FROM tb_categorias;

CREATE TABLE tb_produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    material_categoria INT NOT NULL,
    FOREIGN KEY (material_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_produtos (nome_produto, preco, quantidade_estoque, material_categoria)
VALUES
('Martelo', 25.50, 100, 1),
('Serra Elétrica', 150.00, 50, 1),
('Cimento', 30.00, 200, 3),
('Bloco de Concreto', 4.50, 300, 3),
('Piso Cerâmico', 35.00, 150, 2),
('Tinta Acrílica', 55.00, 80, 2),
('Fios Elétricos', 80.00, 120, 4),
('Mangueira de PVC', 25.00, 60, 5);

SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE preco > 100;

SELECT * FROM tb_produtos WHERE preco BETWEEN 70 AND 150;

SELECT * FROM tb_produtos WHERE nome_produto LIKE "%c%";

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.material_categoria = tb_categorias.id_categoria;

-- EXIBIR MATERIAIS DE ACABAMENTO
SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.material_categoria = tb_categorias.id_categoria
WHERE material_categoria = 2;