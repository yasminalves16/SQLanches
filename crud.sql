 -- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO
  clientes (nome, lealdade)
VALUES
  ('Georgia', 0);

-- 2)
INSERT INTO
  pedidos (status, cliente_id)
VALUES
  ('Recebido', 6);

-- 3)
INSERT INTO
 produtos_pedidos (pedido_id, produto_id)
VALUES
  (6, 1),
  (6, 2),
  (6, 6),
  (6, 8),
  (6, 8);


-- Leitura

-- 1)
SELECT
  c.*,
  p.*,
  prod.*
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id
INNER JOIN produtos_pedidos prodp ON p.id = prodp.pedido_id
INNER JOIN produtos prod ON prod.id = prodp.produto_id
WHERE c.nome = 'Georgia';


-- Atualização

-- 1)
UPDATE 
  clientes
SET 
  lealdade = (
	SELECT SUM(prod.pts_de_lealdade) soma_l
	FROM produtos AS prod
	INNER JOIN produtos_pedidos prodp ON prod.id = prodp.produto_id
	INNER JOIN pedidos p ON prodp.pedido_id = p.id
	INNER JOIN clientes c ON p.cliente_id = c.id
	WHERE c.nome = 'Georgia'
  )
WHERE nome = 'Georgia';


-- Deleção

-- 1)
DELETE FROM clientes c
WHERE c.nome = 'Marcelo';
