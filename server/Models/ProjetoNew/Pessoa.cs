using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProjetoNew.Models.ProjetoNew
{
  [Table("Pessoa", Schema = "dbo")]
  public partial class Pessoa
  {
    public string email_pessoa
    {
      get;
      set;
    }
    public string nome_pessoa
    {
      get;
      set;
    }
    public string responsavel
    {
      get;
      set;
    }
    public string password
    {
      get;
      set;
    }
    public string membro
    {
      get;
      set;
    }
    [Key]
    public int id_Pessoa
    {
      get;
      set;
    }


    public ICollection<Pede> Pedes { get; set; }

    public ICollection<PertenceUi> PertenceUis { get; set; }
    public int index_servicos
    {
      get;
      set;
    }

    public Servico Servico { get; set; }
    public int Num_Inst
    {
      get;
      set;
    }

    public Instituicao Instituicao { get; set; }
    public int id_GT
    {
      get;
      set;
    }

    public Gt Gt { get; set; }
    public string id
    {
      get;
      set;
    }
  }
}
