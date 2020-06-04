using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProjetoNew.Models.ProjetoNew
{
  [Table("esta_atribuido", Schema = "dbo")]
  public partial class EstaAtribuido
  {
    [Key]
    public int index_Recurso
    {
      get;
      set;
    }

    public Recurso Recurso { get; set; }
    [Key]
    public int index_servicos
    {
      get;
      set;
    }

    public Servico Servico { get; set; }
  }
}
