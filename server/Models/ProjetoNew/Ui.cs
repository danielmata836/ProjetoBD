using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProjetoNew.Models.ProjetoNew
{
  [Table("UI", Schema = "dbo")]
  public partial class Ui
  {
    public string nome_UI
    {
      get;
      set;
    }
    public string acronimo_UI
    {
      get;
      set;
    }
    public string morada_UI
    {
      get;
      set;
    }
    [Key]
    public int id_UI
    {
      get;
      set;
    }


    public ICollection<PertenceUi> PertenceUis { get; set; }
  }
}
