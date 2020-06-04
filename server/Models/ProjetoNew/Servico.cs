using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProjetoNew.Models.ProjetoNew
{
  [Table("Servicos", Schema = "dbo")]
  public partial class Servico
  {
    public string designa_pt_servicos
    {
      get;
      set;
    }
    public string designa_en_servicos
    {
      get;
      set;
    }
    public string inst_dispo_servicos
    {
      get;
      set;
    }
    [Key]
    public int index_servicos
    {
      get;
      set;
    }


    public ICollection<EstaAtribuido> EstaAtribuidos { get; set; }

    public ICollection<Pessoa> Pessoas { get; set; }

    public ICollection<Pede> Pedes { get; set; }
    public string obs_servicos
    {
      get;
      set;
    }
    public double custo_servicos
    {
      get;
      set;
    }
    public string desc_servicos
    {
      get;
      set;
    }
    public int id_GT
    {
      get;
      set;
    }

    public Gt Gt { get; set; }
    public DateTime? data_inicio
    {
      get;
      set;
    }
    public DateTime? data_fim
    {
      get;
      set;
    }
  }
}
