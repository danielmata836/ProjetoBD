using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProjetoNew.Models.ProjetoNew
{
  [Table("Produtos", Schema = "dbo")]
  public partial class Produto
  {
    [Key]
    public int niv_produtos
    {
      get;
      set;
    }
    public string tipo_produtos
    {
      get;
      set;
    }
    public string descricaoProduto
    {
      get;
      set;
    }
    public int index_Recurso
    {
      get;
      set;
    }
  }
}
