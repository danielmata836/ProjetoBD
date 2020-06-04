using System;
using System.Net;
using System.Data;
using System.Linq;
using Microsoft.Data.SqlClient;
using System.Collections.Generic;
using Newtonsoft.Json.Linq;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNet.OData;
using Microsoft.AspNet.OData.Routing;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.AspNet.OData.Query;



namespace ProjetoNew.Controllers.ProjetoNew
{
  using Models;
  using Data;
  using Models.ProjetoNew;

  [ODataRoutePrefix("odata/ProjetoNew/Produtos")]
  [Route("mvc/odata/ProjetoNew/Produtos")]
  public partial class ProdutosController : ODataController
  {
    private Data.ProjetoNewContext context;

    public ProdutosController(Data.ProjetoNewContext context)
    {
      this.context = context;
    }
    // GET /odata/ProjetoNew/Produtos
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet]
    public IEnumerable<Models.ProjetoNew.Produto> GetProdutos()
    {
      var items = this.context.Produtos.AsNoTracking().AsQueryable<Models.ProjetoNew.Produto>();
      this.OnProdutosRead(ref items);

      return items;
    }

    partial void OnProdutosRead(ref IQueryable<Models.ProjetoNew.Produto> items);

    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet("{niv_produtos}")]
    public SingleResult<Produto> GetProduto(int key)
    {
        var items = this.context.Produtos.AsNoTracking().Where(i=>i.niv_produtos == key);
        this.OnProdutosGet(ref items);

        return SingleResult.Create(items);
    }

    partial void OnProdutosGet(ref IQueryable<Models.ProjetoNew.Produto> items);

  }
}
