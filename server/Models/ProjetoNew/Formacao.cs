using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProjetoNew.Models.ProjetoNew
{
  [Table("Formacao", Schema = "dbo")]
  public partial class Formacao
  {
    public string tipo_formacao
    {
      get;
      set;
    }
    public string descricao_Formacao
    {
      get;
      set;
    }
    public int index_Recurso
    {
      get;
      set;
    }

    public Recurso Recurso { get; set; }
    public string tipo_Ensino
    {
      get;
      set;
    }
    [Key]
    public int index_formacao
    {
      get;
      set;
    }
  }
}
