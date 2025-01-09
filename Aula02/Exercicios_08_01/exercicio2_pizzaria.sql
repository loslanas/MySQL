
CREATE DATABASE db_pizzaria_legal;


USE db_pizzaria_legal;


CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,  
    nome_categoria VARCHAR(50) NOT NULL,          
    descricao_categoria VARCHAR(255)             
);

INSERT INTO tb_categorias (nome_categoria, descricao_categoria)
VALUES
('Tradicional', 'Pizzas clássicas e populares, como Margherita e Calabresa'),
('Premium', 'Pizzas com ingredientes sofisticados e receitas exclusivas'),
('Vegetariana', 'Opções sem carne, com vegetais e queijos especiais'),
('Vegana', 'Pizzas livres de produtos de origem animal'),
('Doce', 'Pizzas com coberturas doces para sobremesa');

SELECT * FROM tb_categorias;

CREATE TABLE tb_pizzas (
    id_pizza INT AUTO_INCREMENT PRIMARY KEY,      
    nome_pizza VARCHAR(50) NOT NULL,              
    preco DECIMAL(10, 2) NOT NULL,                
    ingredientes VARCHAR(255) NOT NULL,                  
    tamanho VARCHAR(25) NOT NULL,
    pizza_categoria INT NOT NULL,                    
    FOREIGN KEY (pizza_categoria) REFERENCES tb_categorias(id_categoria) 
);

INSERT INTO tb_pizzas (nome_pizza, preco, ingredientes, tamanho, pizza_categoria)
VALUES
('Margherita', 35.00, 'Molho de tomate, muçarela, manjericão', 'Média', 1),
('Calabresa', 28.00, 'Calabresa, cebola, muçarela, orégano', 'Grande', 1), 
('Quatro Queijos', 55.00, 'Muçarela, parmesão, gorgonzola, provolone', 'Média', 2), 
('Pesto Especial', 70.00, 'Molho pesto, tomate seco, muçarela de búfala', 'Grande', 2), 
('Vegetariana Suprema', 45.90, 'Abobrinha, berinjela, tomate seco, rúcula', 'Média', 3), 
('Veggie Delight', 39.90, 'Molho de tomate, cogumelos, pimentão, azeitonas', 'Grande', 3), 
('Brigadeiro', 20.00, 'Chocolate, granulado, leite condensado', 'Brotinho', 5), 
('Banana com Canela', 22.00, 'Banana, açúcar, canela, leite condensado', 'Brotinho', 5);

SELECT * FROM tb_pizzas;

SELECT * FROM tb_pizzas WHERE preco > 45;

SELECT * FROM tb_pizzas WHERE preco BETWEEN 50 AND 100;

SELECT * FROM tb_pizzas WHERE nome_pizza LIKE "%m%";

SELECT * FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.pizza_categoria = tb_categorias.id_categoria;

-- EXIBIR PIZZAS VEGANAS
SELECT * FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.pizza_categoria = tb_categorias.id_categoria
WHERE pizza_categoria = 3;


