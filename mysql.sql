-- ===========================================================
-- EXEMPLO BÁSICO MYSQL: BANCO + TABELAS + CRUD + INNER JOIN
-- ===========================================================

-- 1️⃣ CRIAR BANCO DE DADOS
CREATE DATABASE exemplo_join;
USE exemplo_join;

-- 2️⃣ CRIAR TABELAS
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    cidade VARCHAR(50)
);

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- 3️⃣ INSERIR DADOS (CREATE)
INSERT INTO clientes (nome, cidade) VALUES
('Ana', 'Sorocaba'),
('Bruno', 'Itu'),
('Carla', 'Salto');

INSERT INTO pedidos (id_cliente, data_pedido, valor_total) VALUES
(1, '2025-10-01', 200.00),
(1, '2025-10-10', 150.00),
(2, '2025-10-15', 300.00);

-- 4️⃣ CONSULTAR DADOS (READ)
SELECT * FROM clientes;
SELECT * FROM pedidos;

-- 5️⃣ INNER JOIN: unir clientes e pedidos
-- Mostra apenas os clientes que têm pedidos registrados
SELECT 
    clientes.nome,
    clientes.cidade,
    pedidos.id_pedido,
    pedidos.valor_total
FROM 
    clientes
INNER JOIN pedidos
    ON clientes.id_cliente = pedidos.id_cliente;

-- 6️⃣ ATUALIZAR DADOS (UPDATE)
-- Atualiza o valor do pedido de Ana (id_pedido = 1)
UPDATE pedidos
SET valor_total = 250.00
WHERE id_pedido = 1;

-- 7️⃣ EXCLUIR DADOS (DELETE)
-- Exclui o pedido número 2
DELETE FROM pedidos
WHERE id_pedido = 2;

-- 8️⃣ CONSULTAR NOVAMENTE PARA VER RESULTADOS
SELECT 
    clientes.nome,
    pedidos.id_pedido,
    pedidos.valor_total
FROM 
    clientes
INNER JOIN pedidos
    ON clientes.id_cliente = pedidos.id_cliente;

-- ===========================================================
-- RESULTADO ESPERADO DO INNER JOIN:
-- nome  | cidade   | id_pedido | valor_total
-- -------|-----------|------------|-------------
-- Ana    | Sorocaba  | 1          | 250.00
-- Bruno  | Itu       | 3          | 300.00
-- ===========================================================
-- Carla não aparece porque não tem pedidos.
-- ===========================================================
