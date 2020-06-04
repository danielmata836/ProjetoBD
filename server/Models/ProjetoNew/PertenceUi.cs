using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProjetoNew.Models.ProjetoNew
{
  [Table("pertenceUI", Schema = "dbo")]
  public partial class PertenceUi
  {
    [Key]
    public int id_UI
    {
      get;
      set;
    }

    public Ui Ui { get; set; }
    [Key]
    public int id_Pessoa
    {
      get;
      set;
    }

    public Pessoa Pessoa { get; set; }
  }
}
