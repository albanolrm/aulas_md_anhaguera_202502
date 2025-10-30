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

-- read
SELECT 
    pedidos.id_pedido,
    clientes.nome,
    clientes.cidade,
    pedidos.data_pedido,
    pedidos.valor_total
FROM 
    pedidos
INNER JOIN clientes
    ON pedidos.id_cliente = clientes.id_cliente;

-- update
UPDATE pedidos
INNER JOIN clientes
    ON pedidos.id_cliente = clientes.id_cliente
SET pedidos.valor_total = pedidos.valor_total * 1.10
WHERE clientes.cidade = 'Sorocaba';

-- select
SELECT 
    c.nome,
    c.cidade,
    p.valor_total
FROM 
    pedidos p
INNER JOIN clientes c
    ON p.id_cliente = c.id_cliente
WHERE p.valor_total > 200;