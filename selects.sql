--- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT 
  p.id,
  p.status,
  p.cliente_id,
  prod.id,
  prod.nome,
  prod.tipo,
  prod.preco,
  prod.pts_de_lealdade
FROM pedidos p
INNER JOIN produtos_pedidos prodp ON p.id = prodp.pedido_id
INNER JOIN produtos prod ON prodp.produto_id = prod.id;

-- 2)
SELECT 
 p.id
FROM pedidos p
INNER JOIN produtos_pedidos prodp ON p.id = prodp.pedido_id
INNER JOIN produtos prod ON prodp.produto_id = prod.id
WHERE prod.nome ILIKE '%fritas';

-- 3)
SELECT
  c.nome AS gostam_de_fritas
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id
INNER JOIN produtos_pedidos prodp ON p.id = prodp.pedido_id
INNER JOIN produtos prod ON prodp.produto_id = prod.id
WHERE prod.nome ILIKE '%fritas';

-- 4)
SELECT 
  SUM(prod.preco)
FROM produtos prod
INNER JOIN produtos_pedidos prodp ON prod.id = prodp.produto_id
INNER JOIN pedidos p ON p.id = prodp.pedido_id
INNER JOIN clientes c ON c.id = p.cliente_id
WHERE p.cliente_id = 5;

-- 5)
SELECT
  prod.nome, 
COUNT(prod.nome)
FROM produtos prod
INNER JOIN produtos_pedidos prodp ON prod.id = prodp.produto_id
GROUP BY prod.nome ORDER BY prod.nome ASC;
