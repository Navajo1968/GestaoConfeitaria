-- Tabela de Usuários
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

-- Tabela de Papéis (Roles)
CREATE TABLE papeis (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Tabela de Permissões
CREATE TABLE permissoes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Tabela de Associação Usuário-Papel
CREATE TABLE usuario_papel (
    usuario_id INTEGER REFERENCES usuarios(id),
    papel_id INTEGER REFERENCES papeis(id),
    PRIMARY KEY (usuario_id, papel_id)
);

-- Tabela de Associação Papel-Permissão
CREATE TABLE papel_permissao (
    papel_id INTEGER REFERENCES papeis(id),
    permissao_id INTEGER REFERENCES permissoes(id),
    PRIMARY KEY (papel_id, permissao_id)
);