-- Aqui você deve colocar os códigos SQL referentes à

-- Criação das tabelas

CREATE TABLE IF NOT EXISTS clientes(
  id BIGSERIAL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  lealdade INTEGER NOT NULL

);

-- Tabela endereços

CREATE TABLE IF NOT EXISTS endereços(
  id BIGSERIAL PRIMARY KEY,
  cep VARCHAR(50) NOT NULL,
  rua VARCHAR(50) NOT NULL,
  numero INTEGER NOT NULL,
  bairro VARCHAR(50) NOT NULL,
  complemento VARCHAR(100),
  cliente_id INTEGER UNIQUE NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);

-- Tabela pedidos

CREATE TABLE IF NOT EXISTS pedidos(
  id BIGSERIAL PRIMARY KEY,
  status VARCHAR(50) NOT NULL,
  cliente_id INTEGER NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);

-- Tabela produtos

CREATE TABLE IF NOT EXISTS produtos(
  id BIGSERIAL PRIMARY KEY,
  nome VARCHAR(100) UNIQUE NOT NULL,
  tipo VARCHAR(30) NOT NULL,
  preço FLOAT NOT NULL,
  pts_de_lealdade INTEGER NOT NULL
);

-- Tabela produtos_pedidos

CREATE TABLE IF NOT EXISTS produtos_pedidos(
  id BIGSERIAL PRIMARY KEY,
  pedido_id INTEGER NOT NULL,
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
  produto_id INTEGER NOT NULL,
  FOREIGN KEY (produto_id) REFERENCES produtos(id)
);
