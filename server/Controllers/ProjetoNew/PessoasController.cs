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

  [ODataRoutePrefix("odata/ProjetoNew/Pessoas")]
  [Route("mvc/odata/ProjetoNew/Pessoas")]
  public partial class PessoasController : ODataController
  {
    private Data.ProjetoNewContext context;

    public PessoasController(Data.ProjetoNewContext context)
    {
      this.context = context;
    }
    // GET /odata/ProjetoNew/Pessoas
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet]
    public IEnumerable<Models.ProjetoNew.Pessoa> GetPessoas()
    {
      var items = this.context.Pessoas.AsQueryable<Models.ProjetoNew.Pessoa>();
      this.OnPessoasRead(ref items);

      return items;
    }

    partial void OnPessoasRead(ref IQueryable<Models.ProjetoNew.Pessoa> items);

    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet("{id_Pessoa}")]
    public SingleResult<Pessoa> GetPessoa(int key)
    {
        var items = this.context.Pessoas.Where(i=>i.id_Pessoa == key);
        this.OnPessoasGet(ref items);

        return SingleResult.Create(items);
    }

    partial void OnPessoasGet(ref IQueryable<Models.ProjetoNew.Pessoa> items);

    partial void OnPessoaDeleted(Models.ProjetoNew.Pessoa item);

    [HttpDelete("{id_Pessoa}")]
    public IActionResult DeletePessoa(int key)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }


            var item = this.context.Pessoas
                .Where(i => i.id_Pessoa == key)
                .Include(i => i.Pedes)
                .Include(i => i.PertenceUis)
                .FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            this.OnPessoaDeleted(item);
            this.context.Pessoas.Remove(item);
            this.context.SaveChanges();

            return new NoContentResult();
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnPessoaUpdated(Models.ProjetoNew.Pessoa item);

    [HttpPut("{id_Pessoa}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PutPessoa(int key, [FromBody]Models.ProjetoNew.Pessoa newItem)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (newItem == null || (newItem.id_Pessoa != key))
            {
                return BadRequest();
            }

            this.OnPessoaUpdated(newItem);
            this.context.Pessoas.Update(newItem);
            this.context.SaveChanges();

            var itemToReturn = this.context.Pessoas.Where(i => i.id_Pessoa == key);
            Request.QueryString = Request.QueryString.Add("$expand", "Servico,Instituicao,Gt");
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    [HttpPatch("{id_Pessoa}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PatchPessoa(int key, [FromBody]Delta<Models.ProjetoNew.Pessoa> patch)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var item = this.context.Pessoas.Where(i => i.id_Pessoa == key).FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            patch.Patch(item);

            this.OnPessoaUpdated(item);
            this.context.Pessoas.Update(item);
            this.context.SaveChanges();

            var itemToReturn = this.context.Pessoas.Where(i => i.id_Pessoa == key);
            Request.QueryString = Request.QueryString.Add("$expand", "Servico,Instituicao,Gt");
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnPessoaCreated(Models.ProjetoNew.Pessoa item);

    [HttpPost]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult Post([FromBody] Models.ProjetoNew.Pessoa item)
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

            this.OnPessoaCreated(item);
            this.context.Pessoas.Add(item);
            this.context.SaveChanges();

            var key = item.id_Pessoa;

            var itemToReturn = this.context.Pessoas.Where(i => i.id_Pessoa == key);

            Request.QueryString = Request.QueryString.Add("$expand", "Servico,Instituicao,Gt");

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
