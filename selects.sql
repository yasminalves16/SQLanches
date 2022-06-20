-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)

SELECT
  ped.id,
  ped.status,
  ped.cliente_id,
  prod.id,
  prod.nome,
  prod.tipo,
  prod.preço,
  prod.pts_de_lealdade
FROM
  produtos_pedidos AS pp
  INNER JOIN pedidos ped ON ped.id = pp.pedido_id
  INNER JOIN produtos prod ON prod.id = pp.produto_id;

-- 2)

SELECT
  ped.id
FROM
  produtos_pedidos AS pp
  INNER JOIN pedidos ped ON ped.id = pp.pedido_id
  INNER JOIN produtos prod ON prod.id = pp.produto_id
  WHERE prod.nome LIKE 'Fritas';

-- 3)

SELECT
  c.nome as gostam_de_fritas
FROM
  produtos_pedidos AS pp
  INNER JOIN pedidos ped ON ped.id = pp.pedido_id
  INNER JOIN produtos prod ON prod.id = pp.produto_id
  INNER JOIN clientes c ON c.id = ped.cliente_id 
  WHERE prod.nome LIKE 'Fritas';

-- 4)

SELECT
  SUM(preço)
FROM
  produtos_pedidos AS pp
  INNER JOIN pedidos ped ON ped.id = pp.pedido_id
  INNER JOIN produtos prod ON prod.id = pp.produto_id
  INNER JOIN clientes c ON c.id = ped.cliente_id 
  WHERE c.nome LIKE 'Laura';

-- 5)

SELECT
  prod.nome, COUNT(*)
FROM
  produtos_pedidos AS pp
  INNER JOIN pedidos ped ON ped.id = pp.pedido_id
  INNER JOIN produtos prod ON prod.id = pp.produto_id
  INNER JOIN clientes c ON c.id = ped.cliente_id
  GROUP BY prod.nome
  ORDER BY prod.nome;
