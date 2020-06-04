export interface Equipamento {
  no_regis_produto: number;
  nome_equi: string;
  index_Recurso: number;
  garantia: string;
  categoria: string;
  Equi_obs: string;
}

export interface EstaAtribuido {
  index_Recurso: number;
  index_servicos: number;
}

export interface Formacao {
  tipo_formacao: string;
  descricao_Formacao: string;
  index_Recurso: number;
  tipo_Ensino: string;
}

export interface Gt {
  sigla: string;
  id_GT: number;
  nome_GT: string;
}

export interface Instituicao {
  Tipo_Inst: string;
  Nome_Inst: string;
  Num_Inst: number;
  Morada_Inst: string;
  Parceiro: string;
  acronimo: string;
  Formacao: string;
}

export interface Pede {
  id_Pessoa: number;
  index_servicos: number;
}

export interface PertenceUi {
  id_UI: number;
  id_Pessoa: number;
}

export interface Pertencer {
  Num_Inst: number;
  no_regis_produto: number;
}

export interface Pessoa {
  email_pessoa: string;
  nome_pessoa: string;
  responsavel: string;
  password: string;
  membro: string;
  id_Pessoa: number;
  index_servicos: number;
  Num_Inst: number;
  id_GT: number;
  id: string;
}

export interface Produto {
  niv_produtos: number;
  tipo_produtos: string;
  descricaoProduto: string;
  index_Recurso: number;
}

export interface Recurso {
  obs: string;
  Designacao_EN: string;
  Designacao_PT: string;
  res: string;
  web: string;
  custo: number;
  index_Recurso: number;
  Dado: string;
}

export interface Servico {
  designa_pt_servicos: string;
  designa_en_servicos: string;
  inst_dispo_servicos: string;
  index_servicos: number;
  obs_servicos: string;
  custo_servicos: number;
  desc_servicos: string;
  id_GT: number;
  data_inicio: string;
  data_fim: string;
}

export interface Ui {
  nome_UI: string;
  acronimo_UI: string;
  morada_UI: string;
  id_UI: number;
}
