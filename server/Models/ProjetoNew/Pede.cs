using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProjetoNew.Models.ProjetoNew
{
  [Table("pede", Schema = "dbo")]
  public partial class Pede
  {
    [Key]
    public int id_Pessoa
    {
      get;
      set;
    }

    public Pessoa Pessoa { get; set; }
    [Key]
    public int index_servicos
    {
      get;
      set;
    }

    public Servico Servico { get; set; }
  }
}
