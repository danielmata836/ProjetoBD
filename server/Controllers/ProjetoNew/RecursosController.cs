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

  [ODataRoutePrefix("odata/ProjetoNew/Recursos")]
  [Route("mvc/odata/ProjetoNew/Recursos")]
  public partial class RecursosController : ODataController
  {
    private Data.ProjetoNewContext context;

    public RecursosController(Data.ProjetoNewContext context)
    {
      this.context = context;
    }
    // GET /odata/ProjetoNew/Recursos
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet]
    public IEnumerable<Models.ProjetoNew.Recurso> GetRecursos()
    {
      var items = this.context.Recursos.AsQueryable<Models.ProjetoNew.Recurso>();
      this.OnRecursosRead(ref items);

      return items;
    }

    partial void OnRecursosRead(ref IQueryable<Models.ProjetoNew.Recurso> items);

    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet("{index_Recurso}")]
    public SingleResult<Recurso> GetRecurso(int key)
    {
        var items = this.context.Recursos.Where(i=>i.index_Recurso == key);
        this.OnRecursosGet(ref items);

        return SingleResult.Create(items);
    }

    partial void OnRecursosGet(ref IQueryable<Models.ProjetoNew.Recurso> items);

    partial void OnRecursoDeleted(Models.ProjetoNew.Recurso item);

    [HttpDelete("{index_Recurso}")]
    public IActionResult DeleteRecurso(int key)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }


            var item = this.context.Recursos
                .Where(i => i.index_Recurso == key)
                .Include(i => i.Equipamentos)
                .Include(i => i.EstaAtribuidos)
                .FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            this.OnRecursoDeleted(item);
            this.context.Recursos.Remove(item);
            this.context.SaveChanges();

            return new NoContentResult();
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnRecursoUpdated(Models.ProjetoNew.Recurso item);

    [HttpPut("{index_Recurso}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PutRecurso(int key, [FromBody]Models.ProjetoNew.Recurso newItem)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (newItem == null || (newItem.index_Recurso != key))
            {
                return BadRequest();
            }

            this.OnRecursoUpdated(newItem);
            this.context.Recursos.Update(newItem);
            this.context.SaveChanges();

            var itemToReturn = this.context.Recursos.Where(i => i.index_Recurso == key);
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    [HttpPatch("{index_Recurso}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PatchRecurso(int key, [FromBody]Delta<Models.ProjetoNew.Recurso> patch)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var item = this.context.Recursos.Where(i => i.index_Recurso == key).FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            patch.Patch(item);

            this.OnRecursoUpdated(item);
            this.context.Recursos.Update(item);
            this.context.SaveChanges();

            var itemToReturn = this.context.Recursos.Where(i => i.index_Recurso == key);
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnRecursoCreated(Models.ProjetoNew.Recurso item);

    [HttpPost]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult Post([FromBody] Models.ProjetoNew.Recurso item)
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

            this.OnRecursoCreated(item);
            this.context.Recursos.Add(item);
            this.context.SaveChanges();

            return Created($"odata/ProjetoNew/Recursos/{item.index_Recurso}", item);
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }
  }
}
