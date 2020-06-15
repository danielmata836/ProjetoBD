export interface Formacao {
  tipo_formacao: string;
  descricao_Formacao: string;
  index_Recurso: number;
  tipo_Ensino: string;
  index_formacao: number;
}

export interface Produto {
  niv_produtos: number;
  tipo_produtos: string;
  descricaoProduto: string;
  index_Recurso: number;
  index_produtos: number;
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
