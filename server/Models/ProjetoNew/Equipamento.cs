using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProjetoNew.Models.ProjetoNew
{
  [Table("Equipamento", Schema = "dbo")]
  public partial class Equipamento
  {
    [Key]
    public int no_regis_produto
    {
      get;
      set;
    }


    public ICollection<Pertencer> Pertencers { get; set; }
    public string nome_equi
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
    public DateTime? garantia
    {
      get;
      set;
    }
    public string categoria
    {
      get;
      set;
    }
    public string Equi_obs
    {
      get;
      set;
    }
  }
}
