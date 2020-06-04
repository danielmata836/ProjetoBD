using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProjetoNew.Models.ProjetoNew
{
  [Table("Instituicao", Schema = "dbo")]
  public partial class Instituicao
  {
    public string Tipo_Inst
    {
      get;
      set;
    }
    public string Nome_Inst
    {
      get;
      set;
    }
    [Key]
    public int Num_Inst
    {
      get;
      set;
    }


    public ICollection<Pertencer> Pertencers { get; set; }

    public ICollection<Pessoa> Pessoas { get; set; }
    public string Morada_Inst
    {
      get;
      set;
    }
    public string Parceiro
    {
      get;
      set;
    }
    public string acronimo
    {
      get;
      set;
    }
    public string Formacao
    {
      get;
      set;
    }
  }
}
