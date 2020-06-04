using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProjetoNew.Models.ProjetoNew
{
  [Table("GT", Schema = "dbo")]
  public partial class Gt
  {
    public string sigla
    {
      get;
      set;
    }
    [Key]
    public int id_GT
    {
      get;
      set;
    }


    public ICollection<Servico> Servicos { get; set; }

    public ICollection<Pessoa> Pessoas { get; set; }
    public string nome_GT
    {
      get;
      set;
    }
  }
}
