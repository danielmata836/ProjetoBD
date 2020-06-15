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
      var items = this.context.Produtos.AsQueryable<Models.ProjetoNew.Produto>();
      this.OnProdutosRead(ref items);

      return items;
    }

    partial void OnProdutosRead(ref IQueryable<Models.ProjetoNew.Produto> items);

    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet("{index_produtos}")]
    public SingleResult<Produto> GetProduto(int key)
    {
        var items = this.context.Produtos.Where(i=>i.index_produtos == key);
        this.OnProdutosGet(ref items);

        return SingleResult.Create(items);
    }

    partial void OnProdutosGet(ref IQueryable<Models.ProjetoNew.Produto> items);

    partial void OnProdutoDeleted(Models.ProjetoNew.Produto item);

    [HttpDelete("{index_produtos}")]
    public IActionResult DeleteProduto(int key)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }


            var item = this.context.Produtos
                .Where(i => i.index_produtos == key)
                .FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            this.OnProdutoDeleted(item);
            this.context.Produtos.Remove(item);
            this.context.SaveChanges();

            return new NoContentResult();
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnProdutoUpdated(Models.ProjetoNew.Produto item);

    [HttpPut("{index_produtos}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PutProduto(int key, [FromBody]Models.ProjetoNew.Produto newItem)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (newItem == null || (newItem.index_produtos != key))
            {
                return BadRequest();
            }

            this.OnProdutoUpdated(newItem);
            this.context.Produtos.Update(newItem);
            this.context.SaveChanges();

            var itemToReturn = this.context.Produtos.Where(i => i.index_produtos == key);
            Request.QueryString = Request.QueryString.Add("$expand", "Recurso");
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    [HttpPatch("{index_produtos}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PatchProduto(int key, [FromBody]Delta<Models.ProjetoNew.Produto> patch)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var item = this.context.Produtos.Where(i => i.index_produtos == key).FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            patch.Patch(item);

            this.OnProdutoUpdated(item);
            this.context.Produtos.Update(item);
            this.context.SaveChanges();

            var itemToReturn = this.context.Produtos.Where(i => i.index_produtos == key);
            Request.QueryString = Request.QueryString.Add("$expand", "Recurso");
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnProdutoCreated(Models.ProjetoNew.Produto item);

    [HttpPost]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult Post([FromBody] Models.ProjetoNew.Produto item)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (item == null)
            {
                return BadRequest();
            }

            this.OnProdutoCreated(item);
            this.context.Produtos.Add(item);
            this.context.SaveChanges();

            var key = item.index_produtos;

            var itemToReturn = this.context.Produtos.Where(i => i.index_produtos == key);

            Request.QueryString = Request.QueryString.Add("$expand", "Recurso");

            return new ObjectResult(SingleResult.Create(itemToReturn))
            {
                StatusCode = 201
            };
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }
  }
}
