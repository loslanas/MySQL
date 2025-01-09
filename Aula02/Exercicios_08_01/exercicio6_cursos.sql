
CREATE DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL,
    descricao_categoria varchar(255)
);

CREATE TABLE tb_cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    duracao INT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    curso_categoria INT NOT NULL,
    FOREIGN KEY (curso_categoria) REFERENCES tb_categorias(id_categoria)
);

-- QUIS VARIAR NA ORDEM DA ESTRUTURA
INSERT INTO tb_categorias (nome_categoria, descricao_categoria)
VALUES
('Tecnologia', 'Cursos na área de programação, desenvolvimento de software e outras tecnologias'),
('Marketing', 'Cursos sobre estratégias de marketing, publicidade e vendas'),
('Gestão', 'Cursos sobre administração, gestão de equipes e negócios'),
('Design', 'Cursos sobre design gráfico, design de interface e design de produtos'),
('Linguagens', 'Cursos sobre idiomas e linguagens de programação');

INSERT INTO tb_cursos (nome_curso, duracao, preco, curso_categoria)
VALUES
('Curso de Desenvolvimento Web', 40, 450.00, 1),
('Introdução ao Marketing Digital', 30, 250.00, 2),
('Gestão de Equipes e Liderança', 50, 550.00, 3),
('Design Gráfico Avançado', 60, 700.00, 4),
('Curso Completo de Python', 45, 400.00, 1),
('Marketing de Conteúdo', 35, 300.00, 2),
('Gestão de Projetos Ágeis', 55, 600.00, 3),
('UX/UI Design para Iniciantes', 40, 350.00, 4);

SELECT * FROM tb_categorias;

SELECT * FROM tb_cursos;

SELECT * FROM tb_cursos WHERE preco > 500;

SELECT * FROM tb_cursos WHERE preco BETWEEN 600 AND 1000;

SELECT * FROM tb_cursos WHERE nome_curso LIKE "%j%";

SELECT * FROM tb_cursos INNER JOIN tb_categorias
ON tb_cursos.curso_categoria = tb_categorias.id_categoria;

-- EXIBIR cursos de tecnologia
SELECT * FROM tb_cursos INNER JOIN tb_categorias
ON tb_cursos.curso_categoria = tb_categorias.id_categoria
WHERE curso_categoria = 1;

SELECT * FROM tb_cursos INNER JOIN tb_categorias
ON tb_cursos.curso_categoria = tb_categorias.id_categoria
ORDER BY preco DESC;

-- Ver qual das categorias de curso tem maior preço médio 
SELECT tb_categorias.nome_categoria, ROUND(AVG(preco), 2)  as preco_medio
FROM tb_cursos INNER JOIN tb_categorias
ON tb_cursos.curso_categoria =  tb_categorias.id_categoria
GROUP BY tb_categorias.nome_categoria
ORDER BY preco_medio DESC;

-- exibir os cursos da categoria de tecnologia que o valor seja maior que 400 reais
SELECT * FROM tb_cursos INNER JOIN tb_categorias
ON tb_cursos.curso_categoria = tb_categorias.id_categoria
WHERE curso_categoria = 1
HAVING preco > 400;

-- GEPETO RECLAMOU DE UTILIZAR O HAVING E NÃO O AND
SELECT * FROM tb_cursos INNER JOIN tb_categorias
ON tb_cursos.curso_categoria = tb_categorias.id_categoria
WHERE nome_curso LIKE "%Gestao%"
HAVING preco < 600;