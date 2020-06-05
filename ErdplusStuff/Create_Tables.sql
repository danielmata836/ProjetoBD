CREATE TABLE Instituicao
(
  Tipo_Inst VARCHAR(100) NOT NULL,
  Nome_Inst VARCHAR(100) NOT NULL,
  Num_Inst INT NOT NULL,
  Morada_Inst VARCHAR(100) NOT NULL,
  Parceiro VARCHAR(100) NOT NULL,
  acronimo VARCHAR(100) NOT NULL,
  Formacao VARCHAR(100) NOT NULL,
  PRIMARY KEY (Num_Inst)
);

CREATE TABLE Recursos
(
  obs VARCHAR(100) NOT NULL,
  Designacao_EN VARCHAR(100),
  Designacao_PT VARCHAR(100) NOT NULL,
  res VARCHAR(100),
  web VARCHAR(100),
  custo FLOAT,
  index_Recurso INT NOT NULL,
  Dado VARCHAR(100),
  PRIMARY KEY (index_Recurso)
);

CREATE TABLE Produtos
(
  niv_produtos INT NOT NULL,
  tipo_produtos VARCHAR(100) NOT NULL,
  descricaoProduto VARCHAR(100) NOT NULL,
  index_Recurso INT NOT NULL,
  FOREIGN KEY (index_Recurso) REFERENCES Recursos(index_Recurso)
);

CREATE TABLE Formacao
(
  tipo_formacao VARCHAR(100) NOT NULL,
  descricao_Formacao VARCHAR(200) NOT NULL,
  tipo_ensino VARCHAR(100),
  index_Recurso INT NOT NULL,
  FOREIGN KEY (index_Recurso) REFERENCES Recursos(index_Recurso)
);

CREATE TABLE Equipamento
(
  no_regis_produto INT NOT NULL,
  nome_equi VARCHAR(100) NOT NULL,
  categoria VARCHAR(100),
  Equi_obs VARCHAR(100),
  garantia DATE,
  index_Recurso INT NOT NULL,
  PRIMARY KEY (no_regis_produto),
  FOREIGN KEY (index_Recurso) REFERENCES Recursos(index_Recurso)
);

CREATE TABLE GT
(
  sigla VARCHAR(100) NOT NULL,
  id_GT INT NOT NULL,
  nome_GT VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_GT)
);

CREATE TABLE UI
(
  nome_UI VARCHAR(100) NOT NULL,
  acronimo_UI VARCHAR(100) NOT NULL,
  morada_UI VARCHAR(100) NOT NULL,
  id_UI INT NOT NULL,
  PRIMARY KEY (id_UI)
);

CREATE TABLE pertencer
(
  Num_Inst INT NOT NULL,
  no_regis_produto INT NOT NULL,
  PRIMARY KEY (Num_Inst, no_regis_produto),
  FOREIGN KEY (Num_Inst) REFERENCES Instituicao(Num_Inst),
  FOREIGN KEY (no_regis_produto) REFERENCES Equipamento(no_regis_produto)
);

CREATE TABLE Servicos
(
  designa_pt_servicos VARCHAR(100) NOT NULL,
  designa_en_servicos VARCHAR(100) NOT NULL,
  inst_dispo_servicos VARCHAR(100) NOT NULL,
  index_servicos INT NOT NULL,
  obs_servicos VARCHAR(100) NOT NULL,
  custo_servicos FLOAT NOT NULL,
  data_inicio DATE,
  data_fim DATE,
  desc_servicos VARCHAR(100) NOT NULL,
  id_GT INT NOT NULL,
  PRIMARY KEY (index_servicos),
  FOREIGN KEY (id_GT) REFERENCES GT(id_GT)
);

CREATE TABLE esta_atribuido
(
  index_Recurso INT NOT NULL,
  index_servicos INT NOT NULL,
  PRIMARY KEY (index_Recurso, index_servicos),
  FOREIGN KEY (index_Recurso) REFERENCES Recursos(index_Recurso),
  FOREIGN KEY (index_servicos) REFERENCES Servicos(index_servicos)
);

CREATE TABLE Pessoa
(
  email_pessoa VARCHAR(100),
  nome_pessoa VARCHAR(100),
  responsavel VARCHAR(10),
  membro VARCHAR(1),
  id_Pessoa INT NOT NULL,
  index_servicos INT NOT NULL,
  Num_Inst INT NOT NULL,
  id_GT INT NOT NULL,
  PRIMARY KEY (id_Pessoa),
  FOREIGN KEY (index_servicos) REFERENCES Servicos(index_servicos),
  FOREIGN KEY (Num_Inst) REFERENCES Instituicao(Num_Inst),
  FOREIGN KEY (id_GT) REFERENCES GT(id_GT)
);

CREATE TABLE pede
(
  id_Pessoa INT NOT NULL,
  index_servicos INT NOT NULL,
  PRIMARY KEY (id_Pessoa, index_servicos),
  FOREIGN KEY (id_Pessoa) REFERENCES Pessoa(id_Pessoa),
  FOREIGN KEY (index_servicos) REFERENCES Servicos(index_servicos)
);

CREATE TABLE pertenceUI
(
  id_UI INT NOT NULL,
  id_Pessoa INT NOT NULL,
  PRIMARY KEY (id_UI, id_Pessoa),
  FOREIGN KEY (id_UI) REFERENCES UI(id_UI),
  FOREIGN KEY (id_Pessoa) REFERENCES Pessoa(id_Pessoa)
);