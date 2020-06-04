using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProjetoNew.Models.ProjetoNew
{
  [Table("pertencer", Schema = "dbo")]
  public partial class Pertencer
  {
    [Key]
    public int Num_Inst
    {
      get;
      set;
    }

    public Instituicao Instituicao { get; set; }
    [Key]
    public int no_regis_produto
    {
      get;
      set;
    }

    public Equipamento Equipamento { get; set; }
  }
}
