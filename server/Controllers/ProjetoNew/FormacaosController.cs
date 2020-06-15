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

  [ODataRoutePrefix("odata/ProjetoNew/Formacaos")]
  [Route("mvc/odata/ProjetoNew/Formacaos")]
  public partial class FormacaosController : ODataController
  {
    private Data.ProjetoNewContext context;

    public FormacaosController(Data.ProjetoNewContext context)
    {
      this.context = context;
    }
    // GET /odata/ProjetoNew/Formacaos
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet]
    public IEnumerable<Models.ProjetoNew.Formacao> GetFormacaos()
    {
      var items = this.context.Formacaos.AsQueryable<Models.ProjetoNew.Formacao>();
      this.OnFormacaosRead(ref items);

      return items;
    }

    partial void OnFormacaosRead(ref IQueryable<Models.ProjetoNew.Formacao> items);

    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet("{index_formacao}")]
    public SingleResult<Formacao> GetFormacao(int key)
    {
        var items = this.context.Formacaos.Where(i=>i.index_formacao == key);
        this.OnFormacaosGet(ref items);

        return SingleResult.Create(items);
    }

    partial void OnFormacaosGet(ref IQueryable<Models.ProjetoNew.Formacao> items);

    partial void OnFormacaoDeleted(Models.ProjetoNew.Formacao item);

    [HttpDelete("{index_formacao}")]
    public IActionResult DeleteFormacao(int key)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }


            var item = this.context.Formacaos
                .Where(i => i.index_formacao == key)
                .FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            this.OnFormacaoDeleted(item);
            this.context.Formacaos.Remove(item);
            this.context.SaveChanges();

            return new NoContentResult();
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnFormacaoUpdated(Models.ProjetoNew.Formacao item);

    [HttpPut("{index_formacao}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PutFormacao(int key, [FromBody]Models.ProjetoNew.Formacao newItem)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (newItem == null || (newItem.index_formacao != key))
            {
                return BadRequest();
            }

            this.OnFormacaoUpdated(newItem);
            this.context.Formacaos.Update(newItem);
            this.context.SaveChanges();

            var itemToReturn = this.context.Formacaos.Where(i => i.index_formacao == key);
            Request.QueryString = Request.QueryString.Add("$expand", "Recurso");
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    [HttpPatch("{index_formacao}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PatchFormacao(int key, [FromBody]Delta<Models.ProjetoNew.Formacao> patch)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var item = this.context.Formacaos.Where(i => i.index_formacao == key).FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            patch.Patch(item);

            this.OnFormacaoUpdated(item);
            this.context.Formacaos.Update(item);
            this.context.SaveChanges();

            var itemToReturn = this.context.Formacaos.Where(i => i.index_formacao == key);
            Request.QueryString = Request.QueryString.Add("$expand", "Recurso");
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnFormacaoCreated(Models.ProjetoNew.Formacao item);

    [HttpPost]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult Post([FromBody] Models.ProjetoNew.Formacao item)
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

            this.OnFormacaoCreated(item);
            this.context.Formacaos.Add(item);
            this.context.SaveChanges();

            var key = item.index_formacao;

            var itemToReturn = this.context.Formacaos.Where(i => i.index_formacao == key);

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
