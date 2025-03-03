-- Tabela de Clientes
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco TEXT,
    telefone VARCHAR(20),
    email VARCHAR(100),
    dt_inclusao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dt_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Fornecedores
CREATE TABLE fornecedores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco TEXT,
    telefone VARCHAR(20),
    email VARCHAR(100),
    dt_inclusao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dt_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Produtos
CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    validade DATE,
    tipo VARCHAR(20), -- 'insumo' ou 'acabado'
    dt_inclusao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dt_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Estoque
CREATE TABLE estoque (
    id SERIAL PRIMARY KEY,
    produto_id INTEGER REFERENCES produtos(id),
    quantidade INTEGER NOT NULL,
    data_validade DATE,
    dt_inclusao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dt_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Usuários
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    dt_inclusao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dt_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Papéis (Roles)
CREATE TABLE papeis (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    dt_inclusao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dt_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Permissões
CREATE TABLE permissoes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    dt_inclusao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dt_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Associação Usuário-Papel
CREATE TABLE usuario_papel (
    usuario_id INTEGER REFERENCES usuarios(id),
    papel_id INTEGER REFERENCES papeis(id),
    PRIMARY KEY (usuario_id, papel_id),
    dt_inclusao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dt_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Associação Papel-Permissão
CREATE TABLE papel_permissao (
    papel_id INTEGER REFERENCES papeis(id),
    permissao_id INTEGER REFERENCES permissoes(id),
    PRIMARY KEY (papel_id, permissao_id),
    dt_inclusao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dt_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);