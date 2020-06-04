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

  [ODataRoutePrefix("odata/ProjetoNew/EstaAtribuidos")]
  [Route("mvc/odata/ProjetoNew/EstaAtribuidos")]
  public partial class EstaAtribuidosController : ODataController
  {
    private Data.ProjetoNewContext context;

    public EstaAtribuidosController(Data.ProjetoNewContext context)
    {
      this.context = context;
    }
    // GET /odata/ProjetoNew/EstaAtribuidos
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet]
    public IEnumerable<Models.ProjetoNew.EstaAtribuido> GetEstaAtribuidos()
    {
      var items = this.context.EstaAtribuidos.AsQueryable<Models.ProjetoNew.EstaAtribuido>();
      this.OnEstaAtribuidosRead(ref items);

      return items;
    }

    partial void OnEstaAtribuidosRead(ref IQueryable<Models.ProjetoNew.EstaAtribuido> items);

    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet("{index_Recurso},{index_servicos}")]
    public SingleResult<EstaAtribuido> GetEstaAtribuido([FromODataUri] int keyindex_Recurso,[FromODataUri] int keyindex_servicos)
    {
        var items = this.context.EstaAtribuidos.Where(i=>i.index_Recurso == keyindex_Recurso && i.index_servicos == keyindex_servicos);
        this.OnEstaAtribuidosGet(ref items);

        return SingleResult.Create(items);
    }

    partial void OnEstaAtribuidosGet(ref IQueryable<Models.ProjetoNew.EstaAtribuido> items);

    partial void OnEstaAtribuidoDeleted(Models.ProjetoNew.EstaAtribuido item);

    [HttpDelete("{index_Recurso},{index_servicos}")]
    public IActionResult DeleteEstaAtribuido([FromODataUri] int keyindex_Recurso,[FromODataUri] int keyindex_servicos)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }


            var item = this.context.EstaAtribuidos
                .Where(i => i.index_Recurso == keyindex_Recurso && i.index_servicos == keyindex_servicos)
                .FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            this.OnEstaAtribuidoDeleted(item);
            this.context.EstaAtribuidos.Remove(item);
            this.context.SaveChanges();

            return new NoContentResult();
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnEstaAtribuidoUpdated(Models.ProjetoNew.EstaAtribuido item);

    [HttpPut("{index_Recurso},{index_servicos}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PutEstaAtribuido([FromODataUri] int keyindex_Recurso,[FromODataUri] int keyindex_servicos, [FromBody]Models.ProjetoNew.EstaAtribuido newItem)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (newItem == null || (newItem.index_Recurso != keyindex_Recurso && newItem.index_servicos != keyindex_servicos))
            {
                return BadRequest();
            }

            this.OnEstaAtribuidoUpdated(newItem);
            this.context.EstaAtribuidos.Update(newItem);
            this.context.SaveChanges();

            var itemToReturn = this.context.EstaAtribuidos.Where(i => i.index_Recurso == keyindex_Recurso && i.index_servicos == keyindex_servicos);
            Request.QueryString = Request.QueryString.Add("$expand", "Recurso,Servico");
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    [HttpPatch("{index_Recurso},{index_servicos}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PatchEstaAtribuido([FromODataUri] int keyindex_Recurso,[FromODataUri] int keyindex_servicos, [FromBody]Delta<Models.ProjetoNew.EstaAtribuido> patch)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var item = this.context.EstaAtribuidos.Where(i => i.index_Recurso == keyindex_Recurso && i.index_servicos == keyindex_servicos).FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            patch.Patch(item);

            this.OnEstaAtribuidoUpdated(item);
            this.context.EstaAtribuidos.Update(item);
            this.context.SaveChanges();

            var itemToReturn = this.context.EstaAtribuidos.Where(i => i.index_Recurso == keyindex_Recurso && i.index_servicos == keyindex_servicos);
            Request.QueryString = Request.QueryString.Add("$expand", "Recurso,Servico");
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnEstaAtribuidoCreated(Models.ProjetoNew.EstaAtribuido item);

    [HttpPost]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult Post([FromBody] Models.ProjetoNew.EstaAtribuido item)
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

            this.OnEstaAtribuidoCreated(item);
            this.context.EstaAtribuidos.Add(item);
            this.context.SaveChanges();

            var keyindex_Recurso = item.index_Recurso;
            var keyindex_servicos = item.index_servicos;

            var itemToReturn = this.context.EstaAtribuidos.Where(i => i.index_Recurso == keyindex_Recurso && i.index_servicos == keyindex_servicos);

            Request.QueryString = Request.QueryString.Add("$expand", "Recurso,Servico");

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
