using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProjetoNew.Models.ProjetoNew
{
  [Table("Recursos", Schema = "dbo")]
  public partial class Recurso
  {
    public string obs
    {
      get;
      set;
    }
    public string Designacao_EN
    {
      get;
      set;
    }
    public string Designacao_PT
    {
      get;
      set;
    }
    public string res
    {
      get;
      set;
    }
    public string web
    {
      get;
      set;
    }
    public double? custo
    {
      get;
      set;
    }
    [Key]
    public int index_Recurso
    {
      get;
      set;
    }


    public ICollection<Produto> Produtos { get; set; }

    public ICollection<Formacao> Formacaos { get; set; }
    public string Dado
    {
      get;
      set;
    }
  }
}
