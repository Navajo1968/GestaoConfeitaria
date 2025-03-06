
CREATE TABLE tb_cliente
( 
	id_cliente           integer GENERATED ALWAYS AS IDENTITY ,
	nome_fantasia        varchar(60)  NULL ,
	pessoa_fisica_juridica char(1)  NULL ,
	razao_social         varchar(60)  NULL ,
	cpf                  integer  NULL ,
	cnpj                 integer  NULL ,
	inscricao_estadual   varchar(30)  NULL ,
	telefone             varchar(13)  NULL ,
	email                varchar(50)  NULL ,
	rua_endereco         varchar(50)  NULL ,
	num_endereco         char(10)  NULL ,
	bairro_endereco      char(40)  NULL ,
	cidade_endereco      varchar(50)  NULL ,
	estado_endereco      char(2)  NULL ,
	cep_endereco         char(8)  NULL ,
	compl_endereco       varchar(30)  NULL ,
	instragram           varchar(20)  NULL ,
	site                 varchar(100)  NULL ,
	dt_abertura          date  NULL ,
	status_cadastro      char(10)  NULL ,
	des_banco            varchar(30)  NULL ,
	agencia_banco        varchar(15)  NULL ,
	conta_banco          varchar(15)  NULL ,
	chave_pix            varchar(50)  NULL ,
	flg_consentimento    boolean  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_cliente
	ADD CONSTRAINT XPKtb_cliente PRIMARY KEY   (id_cliente )
;



CREATE TABLE tb_cliente_atacado
( 
	id_cliente           integer  NOT NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL ,
	dt_assinatura        DATE  NULL ,
	des_termos_contrato  varchar(20)  NULL ,
	seg_funcionamento    boolean  NULL ,
	ter_funcionamento    boolean  NULL ,
	qua_funcionamento    boolean  NULL ,
	qui_funcionamento    boolean  NULL ,
	sex_funcionamento    boolean  NULL ,
	sab_funcionamento    boolean  NULL ,
	dom_funcionamento    boolean  NULL ,
	seg_hr_abertura      time  NULL ,
	ter_hr_abertura      time  NULL ,
	qua_hr_abertura      time  NULL ,
	qui_hr_abertura      time  NULL ,
	sex_hr_abertura      time  NULL ,
	sab_hr_abertura      time  NULL ,
	dom_hr_abertura      time  NULL ,
	seg_hr_fechamento    time  NULL ,
	ter_hr_fechamento    time  NULL ,
	qua_hr_fechamento    time  NULL ,
	qui_hr_fechamento    time  NULL ,
	sex_hr_fechamento    time  NULL ,
	sab_hr_fechamento    time  NULL ,
	dom_hr_fechamento    time  NULL 
)
;



ALTER TABLE tb_cliente_atacado
	ADD CONSTRAINT XPKtb_cliente_atacado PRIMARY KEY   (id_cliente )
;



CREATE TABLE tb_cliente_consentimento
( 
	id_cliente           integer  NOT NULL ,
	dt_consentimento     date  NOT NULL ,
	meio_consentimento   varchar(30)  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_cliente_consentimento
	ADD CONSTRAINT XPKtb_cliente_consentimento PRIMARY KEY   (id_cliente ,dt_consentimento )
;



CREATE TABLE tb_cliente_data_comemorativa
( 
	dt_comemorativa      date  NULL ,
	des_data_comemorativa varchar(30)  NULL ,
	id_cliente           integer  NOT NULL ,
	id_data_comemorativa integer  NOT NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_cliente_data_comemorativa
	ADD CONSTRAINT XPKtb_cliente_data_comemorativa PRIMARY KEY   (id_cliente ,id_data_comemorativa )
;



CREATE TABLE tb_cliente_empresa
( 
	id_cliente           integer  NOT NULL ,
	id_empresa           integer  NOT NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_cliente_empresa
	ADD CONSTRAINT XPKtb_cliente_empresa PRIMARY KEY   (id_cliente ,id_empresa )
;



CREATE TABLE tb_cliente_representante
( 
	id_cliente           integer  NOT NULL ,
	cidade_atuacao       varchar(20)  NOT NULL ,
	bairro_atuacao       varchar(20)  NOT NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL ,
	dt_inicio_vigencia   date  NOT NULL ,
	dt_fim_vigencia      date  NULL ,
	des_terrmos_contrato text  NULL ,
	dt_assinatura        date  NULL 
)
;



ALTER TABLE tb_cliente_representante
	ADD CONSTRAINT XPKtb_cliente_representante PRIMARY KEY   (id_cliente ,cidade_atuacao ,bairro_atuacao ,dt_inicio_vigencia )
;



CREATE TABLE tb_condicao_pagamento
( 
	id_condicao          integer GENERATED ALWAYS AS IDENTITY ,
	cod_condicao         varchar(20)  NULL ,
	des_condicao         varchar(255)  NULL ,
	qt_parcelas          integer  NULL ,
	tp_pagamento         varchar(20)  NULL ,
	status               boolean  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_condicao_pagamento
	ADD CONSTRAINT XPKtb_condicao_pagamento PRIMARY KEY   (id_condicao )
;



ALTER TABLE tb_condicao_pagamento
	ADD CONSTRAINT XAK1tb_condicao_pagamento UNIQUE (cod_condicao  )
;



CREATE TABLE tb_condicao_pagamento_parcela
( 
	id_parcela           integer GENERATED ALWAYS AS IDENTITY ,
	id_condicao          integer  NOT NULL ,
	num_parcela          integer  NULL ,
	vlr_percentual       decimal(5,2)  NULL ,
	dias_vencimento      integer  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_condicao_pagamento_parcela
	ADD CONSTRAINT XPKtb_condicao_pagamento_parcela PRIMARY KEY   (id_parcela ,id_condicao )
;



CREATE TABLE tb_data_comemorativa
( 
	id_data_comemorativa integer GENERATED ALWAYS AS IDENTITY ,
	dt_comemorativa      DATE NULL,
	des_data             varchar(40)  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_data_comemorativa
	ADD CONSTRAINT XPKtb_data_comemorativa PRIMARY KEY   (id_data_comemorativa )
;



CREATE TABLE tb_data_especial_empresa
( 
	id_data_especial     integer  NOT NULL ,
	id_empresa           integer  NOT NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_data_especial_empresa
	ADD CONSTRAINT XPKtb_data_especial_empresa PRIMARY KEY   (id_data_especial ,id_empresa )
;



CREATE TABLE tb_datas_especiais
( 
	id_data_especial     integer GENERATED ALWAYS AS IDENTITY ,
	des_data_especial    varchar(50)  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_datas_especiais
	ADD CONSTRAINT XPKtb_datas_especiais PRIMARY KEY   (id_data_especial )
;



CREATE TABLE tb_empresa
( 
	id_empresa           integer GENERATED ALWAYS AS IDENTITY ,
	nome_fantasia        varchar(60)  NULL ,
	razao_social         varchar(60)  NULL ,
	cnpj                 integer  NULL ,
	inscricao_estadual   varchar(30)  NULL ,
	regime_tributario    varchar(20)  NULL ,
	telefone             varchar(13)  NULL ,
	email                varchar(50)  NULL ,
	instagram            varchar(20)  NULL ,
	site                 varchar(100)  NULL ,
	dt_abertura          date  NULL ,
	status               varchar(10)  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_empresa
	ADD CONSTRAINT XPKtb_empresa PRIMARY KEY   (id_empresa )
;



CREATE TABLE tb_estrutura_dados_sensiveis
( 
	id_estrutura_dados   integer GENERATED ALWAYS AS IDENTITY ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL ,
	des_tabela           varchar(20)  NULL 
)
;



ALTER TABLE tb_estrutura_dados_sensiveis
	ADD CONSTRAINT XPKtb_estrutura_dados_sensiveis PRIMARY KEY   (id_estrutura_dados )
;



ALTER TABLE tb_estrutura_dados_sensiveis
	ADD CONSTRAINT XAK1tb_estrutura_dados_sensiveis UNIQUE (des_tabela  )
;



CREATE TABLE tb_estrutura_dados_sensiveis_campos
( 
	id_estrutura_campos  integer GENERATED ALWAYS AS IDENTITY ,
	id_estrutura_dados   integer  NOT NULL ,
	des_campo            varchar(20)  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_estrutura_dados_sensiveis_campos
	ADD CONSTRAINT XPKtb_estrutura_dados_sensiveis_campos PRIMARY KEY   (id_estrutura_campos ,id_estrutura_dados )
;



CREATE TABLE tb_estrutura_sistema
( 
	id_estrutura_sistema integer GENERATED ALWAYS AS IDENTITY ,
	cod_tela             varchar(10)  NULL ,
	des_tela             varchar(50)  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL ,
	id_modulo            integer  NOT NULL 
)
;



ALTER TABLE tb_estrutura_sistema
	ADD CONSTRAINT XPKtb_estrutura_sistema PRIMARY KEY   (id_estrutura_sistema ,id_modulo )
;



ALTER TABLE tb_estrutura_sistema
	ADD CONSTRAINT XAK1tb_estrutura_sistema UNIQUE (cod_tela  )
;



CREATE TABLE tb_filial
( 
	id_filial            char(18)  NOT NULL ,
	id_empresa           integer  NOT NULL ,
	nome_fantasia        varchar(60)  NULL ,
	razao_social         varchar(60)  NULL ,
	cnpj                 integer  NULL ,
	inscricao_estadual   varchar(30)  NULL ,
	rua_endereco         varchar(50)  NULL ,
	num_endereco         char(10)  NULL ,
	bairro_endereco      char(40)  NULL ,
	cidade_endereco      varchar(50)  NULL ,
	estado_endereco      char(2)  NULL ,
	cep_endereco         char(8)  NULL ,
	compl_endereco       varchar(30)  NULL ,
	telefone             varchar(13)  NULL ,
	nome_responsavel     varchar(50)  NULL ,
	num_telefone_responsavel char(13)  NULL ,
	seg_hr_abertura      time  NULL ,
	seg_hr_fechamento    time  NULL ,
	status               varchar(10)  NULL ,
	dt_abertura          date  NULL ,
	seg_funcionamento    boolean  NULL ,
	ter_funcionamento    boolean  NULL ,
	qua_funcionamento    boolean  NULL ,
	qui_funcionamento    boolean  NULL ,
	sex_funcionamento    boolean  NULL ,
	sab_funcionamento    boolean  NULL ,
	dom_funcionamento    boolean  NULL ,
	ter_hr_abertura      time  NULL ,
	qua_hr_abertura      time  NULL ,
	qui_hr_abertura      time  NULL ,
	sex_hr_abertura      time  NULL ,
	sab_hr_abertura      time  NULL ,
	dom_hr_abertura      time  NULL ,
	ter_hr_fechamento    time  NULL ,
	qua_hr_fechamento    time  NULL ,
	qui_hr_fechamento    time  NULL ,
	sex_hr_fechamento    time  NULL ,
	sab_hr_fechamento    time  NULL ,
	dom_hr_fechamento    time  NULL ,
	email                varchar(50)  NULL ,
	email_responsavel    varchar(50)  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_filial
	ADD CONSTRAINT XPKtb_filial PRIMARY KEY   (id_filial ,id_empresa )
;



CREATE TABLE tb_log_auditoria
( 
	id_log               integer GENERATED ALWAYS AS IDENTITY ,
	tp_acao              varchar(10)  NULL ,
	nome_tabela          varchar(20)  NULL ,
	dados_anteriores     varchar(60)  NULL ,
	dados_novos          varchar(60)  NULL ,
	dt_hr_acao           TIMESTAMP  NULL ,
	ip_origem            varchar(15)  NULL ,
	des_justificativa    varchar(100)  NULL ,
	campo_afetado        varchar(50)  NULL ,
	chave_registro       varchar(30)  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL ,
	id_usuario           integer  NULL 
)
;



ALTER TABLE tb_log_auditoria
	ADD CONSTRAINT XPKtb_log_auditoria PRIMARY KEY   (id_log )
;



CREATE TABLE tb_meio_condicao_pagamento
( 
	id_condicao          integer  NOT NULL ,
	id_meio_pagamento    integer  NOT NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL ,
	id_tipo_cliente      integer  NOT NULL 
)
;



ALTER TABLE tb_meio_condicao_pagamento
	ADD CONSTRAINT XPKtb_meio_condicao_pagamento PRIMARY KEY   (id_condicao ,id_meio_pagamento ,id_tipo_cliente )
;



CREATE TABLE tb_meio_pagamento
( 
	id_meio_pagamento    integer GENERATED ALWAYS AS IDENTITY ,
	des_meio_pagamento   varchar(50)  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_meio_pagamento
	ADD CONSTRAINT XPKtb_meio_pagamento PRIMARY KEY   (id_meio_pagamento )
;



CREATE TABLE tb_modulos
( 
	id_modulo            integer GENERATED ALWAYS AS IDENTITY ,
	des_modulo           varchar(30)  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_modulos
	ADD CONSTRAINT XPKtb_modulos PRIMARY KEY   (id_modulo )
;



CREATE TABLE tb_produto
( 
	id_produto           integer GENERATED ALWAYS AS IDENTITY ,
	des_produto          varchar(60)  NULL ,
	vlr_peso             integer  NULL ,
	num_ean              char(14)  NULL ,
	status               varchar(10)  NULL ,
	vlr_validade_dias_ambiente integer  NULL ,
	vlr_validade_dias_refrigerado integer  NULL ,
	vlr_validade_dias_congelador integer  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL ,
	id_tipo_produto      char(18)  NOT NULL ,
	id_unidade_medida    integer  NULL 
)
;



ALTER TABLE tb_produto
	ADD CONSTRAINT XPKtb_produto PRIMARY KEY   (id_produto )
;



CREATE TABLE tb_produto_acabado_estoque
( 
	id_poduto_acabado_estoque integer GENERATED ALWAYS AS IDENTITY ,
	qt_estoque           integer  NULL ,
	id_produto_acabado   integer  NULL ,
	id_unidade_medida    integer  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_produto_acabado_estoque
	ADD CONSTRAINT XPKtb_produto_acabado_estoque PRIMARY KEY   (id_poduto_acabado_estoque )
;



CREATE TABLE tb_produto_acabado_movimentacao_estoque
( 
	id_movimentacao      integer GENERATED ALWAYS AS IDENTITY ,
	tp_movimentacao      varchar(10)  NULL ,
	qt_movimentacao      integer  NULL ,
	id_poduto_acabado_estoque integer  NOT NULL ,
	id_tipo_movimentacao_estoque integer  NULL ,
	dt_movimentacao      date  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_produto_acabado_movimentacao_estoque
	ADD CONSTRAINT XPKtb_produto_acabado_movimentacao_estoque PRIMARY KEY   (id_movimentacao )
;



CREATE TABLE tb_produto_ficha_tecnica
( 
	id_ficha_tecnica     integer GENERATED ALWAYS AS IDENTITY ,
	qt_insumo            decimal(10,3)  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL ,
	id_produto_acabado   integer  NULL ,
	id_produto_insumo    integer  NULL ,
	id_unidade_medida    integer  NULL 
)
;



ALTER TABLE tb_produto_ficha_tecnica
	ADD CONSTRAINT XPKtb_produto_ficha_tecnica PRIMARY KEY   (id_ficha_tecnica )
;



CREATE TABLE tb_produto_insumo_estoque
( 
	id_produto_insumo_estoque char(18)  NOT NULL ,
	id_produto_insumo    integer  NULL ,
	id_unidade_medida    integer  NULL ,
	qt_estoque           decimal(10,2)  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_produto_insumo_estoque
	ADD CONSTRAINT XPKtb_produto_insumo_estoque PRIMARY KEY   (id_produto_insumo_estoque )
;



CREATE TABLE tb_produto_insumo_movimentacao_estoque
( 
	id_movimentacao      integer GENERATED ALWAYS AS IDENTITY ,
	id_produto_insumo_estoque char(18)  NULL ,
	id_tipo_movimentacao_estoque integer  NULL ,
	tp_movimentacao      varchar(10)  NULL ,
	qt_movimentacao      decimal(10,2)  NULL ,
	dt_movimentacao      date  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_produto_insumo_movimentacao_estoque
	ADD CONSTRAINT XPKtb_produto_insumo_movimentacao_estoque PRIMARY KEY   (id_movimentacao )
;



CREATE TABLE tb_produto_roteiro_producao
( 
	id_roteiro           integer GENERATED ALWAYS AS IDENTITY ,
	nr_sequencia         integer  NULL ,
	des_etapa            varchar(255)  NULL ,
	tempo_estimado       integer  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL ,
	id_produto_acabado   integer  NULL 
)
;



ALTER TABLE tb_produto_roteiro_producao
	ADD CONSTRAINT XPKtb_produto_roteiro_producao PRIMARY KEY   (id_roteiro )
;



CREATE TABLE tb_produto_tabela_preco
( 
	id_produto_acabado   integer  NOT NULL ,
	id_tabela_preco      integer  NOT NULL ,
	id_tipo_cliente      integer  NOT NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL ,
	vlr_preco            decimal(10,2)  NULL 
)
;



ALTER TABLE tb_produto_tabela_preco
	ADD CONSTRAINT XPKtb_produto_tabela_preco PRIMARY KEY   (id_produto_acabado ,id_tabela_preco ,id_tipo_cliente )
;



CREATE TABLE tb_tabela_preco
( 
	id_tabela_preco      integer GENERATED ALWAYS AS IDENTITY ,
	des_tabela_preco     varchar(60)  NULL ,
	id_tipo_cliente      integer  NOT NULL ,
	dt_inicio_vigencia   date  NULL ,
	dt_fim_vigencia      date  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL ,
	status               varchar(10)  NULL 
)
;



ALTER TABLE tb_tabela_preco
	ADD CONSTRAINT XPKtb_tabela_preco PRIMARY KEY   (id_tabela_preco ,id_tipo_cliente )
;



CREATE TABLE tb_tabela_preco_cliente
( 
	id_tabela_preco      integer  NOT NULL ,
	id_tipo_cliente      integer  NOT NULL ,
	id_cliente           integer  NOT NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_tabela_preco_cliente
	ADD CONSTRAINT XPKtb_tabela_preco_cliente PRIMARY KEY   (id_tabela_preco ,id_tipo_cliente ,id_cliente )
;



CREATE TABLE tb_tipo_cliente
( 
	id_tipo_cliente      integer GENERATED ALWAYS AS IDENTITY ,
	des_tipo_cliente     varchar(20)  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_tipo_cliente
	ADD CONSTRAINT XPKtb_tipo_cliente PRIMARY KEY   (id_tipo_cliente )
;



CREATE TABLE tb_tipo_cliente_cliente
( 
	id_tipo_cliente      integer  NOT NULL ,
	id_cliente           integer  NOT NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_tipo_cliente_cliente
	ADD CONSTRAINT XPKtb_tipo_cliente_cliente PRIMARY KEY   (id_tipo_cliente ,id_cliente )
;



CREATE TABLE tb_tipo_cliente_condicao
( 
	id_tipo_cliente      integer  NOT NULL ,
	id_condicao          integer  NOT NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_tipo_cliente_condicao
	ADD CONSTRAINT XPKtb_tipo_cliente_condicao PRIMARY KEY   (id_tipo_cliente ,id_condicao )
;



CREATE TABLE tb_tipo_cliente_meio_condicao
( 
	id_tipo_cliente      integer  NOT NULL ,
	id_cliente           integer  NOT NULL ,
	id_condicao          integer  NOT NULL ,
	id_meio_pagamento    integer  NOT NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_tipo_cliente_meio_condicao
	ADD CONSTRAINT XPKtb_tipo_cliente_meio_condicao PRIMARY KEY   (id_tipo_cliente ,id_cliente ,id_condicao ,id_meio_pagamento )
;



CREATE TABLE tb_tipo_movimentacao_estoque
( 
	id_tipo_movimentacao_estoque integer GENERATED ALWAYS AS IDENTITY ,
	des_tipo_movimentacao_estoque varchar(60)  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_tipo_movimentacao_estoque
	ADD CONSTRAINT XPKtb_tipo_movimentacao_estoque PRIMARY KEY   (id_tipo_movimentacao_estoque )
;



CREATE TABLE tb_tipo_produto
( 
	id_tipo_produto      char(18)  NOT NULL ,
	des_tipo_produto     char(18)  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_tipo_produto
	ADD CONSTRAINT XPKtb_tipo_produto PRIMARY KEY   (id_tipo_produto )
;



CREATE TABLE tb_unidade_medida
( 
	id_unidade_medida    integer GENERATED ALWAYS AS IDENTITY ,
	des_unidade_medida   varchar(30)  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL 
)
;



ALTER TABLE tb_unidade_medida
	ADD CONSTRAINT XPKtb_unidade_medida PRIMARY KEY   (id_unidade_medida )
;



CREATE TABLE tb_usuario
( 
	id_usuario           integer GENERATED ALWAYS AS IDENTITY ,
	nome                 varchar(60)  NULL ,
	email                varchar(50)  NULL ,
	telefone             varchar(13)  NULL ,
	senha_hash           text  NULL ,
	status               varchar(10)  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL ,
	dt_validade_senha    date  NULL ,
	dt_hr_ultimo_acesso  TIMESTAMP  NULL ,
	usuario              varchar(20)  NULL 
)
;



ALTER TABLE tb_usuario
	ADD CONSTRAINT XPKtb_usuario PRIMARY KEY   (id_usuario )
;



CREATE TABLE tb_usuario_estrutura_dados
( 
	id_estrutura_campos  integer  NOT NULL ,
	id_estrutura_dados   integer  NOT NULL ,
	id_usuario           integer  NOT NULL ,
	flg_nanomizado       boolean  NULL ,
	flg_alterar          boolean  NULL ,
	flg_incluir          boolean  NULL ,
	flg_excluir          boolean  NULL ,
	flg_visualizar       boolean  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL ,
	flg_administrador    boolean  NULL 
)
;



ALTER TABLE tb_usuario_estrutura_dados
	ADD CONSTRAINT XPKtb_usuario_estrutura_dados PRIMARY KEY   (id_estrutura_campos ,id_estrutura_dados ,id_usuario )
;



CREATE TABLE tb_usuario_estrutura_sistema
( 
	id_estrutura_sistema integer  NOT NULL ,
	id_modulo            integer  NOT NULL ,
	id_usuario           integer  NOT NULL ,
	flg_vizualizar       boolean  NULL ,
	flg_alterar          boolean  NULL ,
	flg_incluir          boolean  NULL ,
	flg_excluir          boolean  NULL ,
	flg_processar        boolean  NULL ,
	dt_hr_inclusao       TIMESTAMP  NULL ,
	dt_hr_alteracao      TIMESTAMP  NULL ,
	flg_administrador    boolean  NULL 
)
;



ALTER TABLE tb_usuario_estrutura_sistema
	ADD CONSTRAINT XPKtb_usuario_estrutura_sistema PRIMARY KEY   (id_estrutura_sistema ,id_modulo ,id_usuario )
;




ALTER TABLE tb_cliente_atacado
	ADD CONSTRAINT R_19 FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_cliente_consentimento
	ADD CONSTRAINT R_7 FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_cliente_data_comemorativa
	ADD CONSTRAINT R_5 FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_cliente_data_comemorativa
	ADD CONSTRAINT R_6 FOREIGN KEY (id_data_comemorativa) REFERENCES tb_data_comemorativa(id_data_comemorativa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_cliente_empresa
	ADD CONSTRAINT R_3 FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_cliente_empresa
	ADD CONSTRAINT R_4 FOREIGN KEY (id_empresa) REFERENCES tb_empresa(id_empresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_cliente_representante
	ADD CONSTRAINT R_18 FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_condicao_pagamento_parcela
	ADD CONSTRAINT R_24 FOREIGN KEY (id_condicao) REFERENCES tb_condicao_pagamento(id_condicao)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_data_especial_empresa
	ADD CONSTRAINT R_20 FOREIGN KEY (id_data_especial) REFERENCES tb_datas_especiais(id_data_especial)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_data_especial_empresa
	ADD CONSTRAINT R_21 FOREIGN KEY (id_empresa) REFERENCES tb_empresa(id_empresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_estrutura_dados_sensiveis_campos
	ADD CONSTRAINT R_9 FOREIGN KEY (id_estrutura_dados) REFERENCES tb_estrutura_dados_sensiveis(id_estrutura_dados)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_estrutura_sistema
	ADD CONSTRAINT R_8 FOREIGN KEY (id_modulo) REFERENCES tb_modulos(id_modulo)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_filial
	ADD CONSTRAINT R_2 FOREIGN KEY (id_empresa) REFERENCES tb_empresa(id_empresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_log_auditoria
	ADD CONSTRAINT R_13 FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id_usuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_meio_condicao_pagamento
	ADD CONSTRAINT R_25 FOREIGN KEY (id_condicao) REFERENCES tb_condicao_pagamento(id_condicao)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_meio_condicao_pagamento
	ADD CONSTRAINT R_26 FOREIGN KEY (id_meio_pagamento) REFERENCES tb_meio_pagamento(id_meio_pagamento)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_meio_condicao_pagamento
	ADD CONSTRAINT R_27 FOREIGN KEY (id_tipo_cliente) REFERENCES tb_tipo_cliente(id_tipo_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_produto
	ADD CONSTRAINT R_30 FOREIGN KEY (id_tipo_produto) REFERENCES tb_tipo_produto(id_tipo_produto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_produto
	ADD CONSTRAINT R_31 FOREIGN KEY (id_unidade_medida) REFERENCES tb_unidade_medida(id_unidade_medida)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_produto_acabado_estoque
	ADD CONSTRAINT R_41 FOREIGN KEY (id_produto_acabado) REFERENCES tb_produto(id_produto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_produto_acabado_estoque
	ADD CONSTRAINT R_42 FOREIGN KEY (id_unidade_medida) REFERENCES tb_unidade_medida(id_unidade_medida)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_produto_acabado_movimentacao_estoque
	ADD CONSTRAINT R_43 FOREIGN KEY (id_poduto_acabado_estoque) REFERENCES tb_produto_acabado_estoque(id_poduto_acabado_estoque)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_produto_acabado_movimentacao_estoque
	ADD CONSTRAINT R_44 FOREIGN KEY (id_tipo_movimentacao_estoque) REFERENCES tb_tipo_movimentacao_estoque(id_tipo_movimentacao_estoque)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_produto_ficha_tecnica
	ADD CONSTRAINT R_32 FOREIGN KEY (id_produto_acabado) REFERENCES tb_produto(id_produto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_produto_ficha_tecnica
	ADD CONSTRAINT R_33 FOREIGN KEY (id_produto_insumo) REFERENCES tb_produto(id_produto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_produto_ficha_tecnica
	ADD CONSTRAINT R_34 FOREIGN KEY (id_unidade_medida) REFERENCES tb_unidade_medida(id_unidade_medida)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_produto_insumo_estoque
	ADD CONSTRAINT R_45 FOREIGN KEY (id_produto_insumo) REFERENCES tb_produto(id_produto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_produto_insumo_estoque
	ADD CONSTRAINT R_46 FOREIGN KEY (id_unidade_medida) REFERENCES tb_unidade_medida(id_unidade_medida)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_produto_insumo_movimentacao_estoque
	ADD CONSTRAINT R_47 FOREIGN KEY (id_produto_insumo_estoque) REFERENCES tb_produto_insumo_estoque(id_produto_insumo_estoque)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_produto_insumo_movimentacao_estoque
	ADD CONSTRAINT R_48 FOREIGN KEY (id_tipo_movimentacao_estoque) REFERENCES tb_tipo_movimentacao_estoque(id_tipo_movimentacao_estoque)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_produto_roteiro_producao
	ADD CONSTRAINT R_35 FOREIGN KEY (id_produto_acabado) REFERENCES tb_produto(id_produto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_produto_tabela_preco
	ADD CONSTRAINT R_39 FOREIGN KEY (id_produto_acabado) REFERENCES tb_produto(id_produto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_produto_tabela_preco
	ADD CONSTRAINT R_40 FOREIGN KEY (id_tabela_preco,id_tipo_cliente) REFERENCES tb_tabela_preco(id_tabela_preco,id_tipo_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_tabela_preco
	ADD CONSTRAINT R_36 FOREIGN KEY (id_tipo_cliente) REFERENCES tb_tipo_cliente(id_tipo_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_tabela_preco_cliente
	ADD CONSTRAINT R_37 FOREIGN KEY (id_tabela_preco,id_tipo_cliente) REFERENCES tb_tabela_preco(id_tabela_preco,id_tipo_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_tabela_preco_cliente
	ADD CONSTRAINT R_38 FOREIGN KEY (id_tipo_cliente,id_cliente) REFERENCES tb_tipo_cliente_cliente(id_tipo_cliente,id_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_tipo_cliente_cliente
	ADD CONSTRAINT R_16 FOREIGN KEY (id_tipo_cliente) REFERENCES tb_tipo_cliente(id_tipo_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_tipo_cliente_cliente
	ADD CONSTRAINT R_17 FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_tipo_cliente_condicao
	ADD CONSTRAINT R_22 FOREIGN KEY (id_tipo_cliente) REFERENCES tb_tipo_cliente(id_tipo_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_tipo_cliente_condicao
	ADD CONSTRAINT R_23 FOREIGN KEY (id_condicao) REFERENCES tb_condicao_pagamento(id_condicao)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_tipo_cliente_meio_condicao
	ADD CONSTRAINT R_28 FOREIGN KEY (id_tipo_cliente,id_cliente) REFERENCES tb_tipo_cliente_cliente(id_tipo_cliente,id_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_tipo_cliente_meio_condicao
	ADD CONSTRAINT R_29 FOREIGN KEY (id_condicao,id_meio_pagamento,id_tipo_cliente) REFERENCES tb_meio_condicao_pagamento(id_condicao,id_meio_pagamento,id_tipo_cliente)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_usuario_estrutura_dados
	ADD CONSTRAINT R_14 FOREIGN KEY (id_estrutura_campos,id_estrutura_dados) REFERENCES tb_estrutura_dados_sensiveis_campos(id_estrutura_campos,id_estrutura_dados)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_usuario_estrutura_dados
	ADD CONSTRAINT R_15 FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id_usuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_usuario_estrutura_sistema
	ADD CONSTRAINT R_10 FOREIGN KEY (id_estrutura_sistema,id_modulo) REFERENCES tb_estrutura_sistema(id_estrutura_sistema,id_modulo)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;




ALTER TABLE tb_usuario_estrutura_sistema
	ADD CONSTRAINT R_11 FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id_usuario)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
;


