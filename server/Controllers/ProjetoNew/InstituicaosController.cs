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

  [ODataRoutePrefix("odata/ProjetoNew/Instituicaos")]
  [Route("mvc/odata/ProjetoNew/Instituicaos")]
  public partial class InstituicaosController : ODataController
  {
    private Data.ProjetoNewContext context;

    public InstituicaosController(Data.ProjetoNewContext context)
    {
      this.context = context;
    }
    // GET /odata/ProjetoNew/Instituicaos
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet]
    public IEnumerable<Models.ProjetoNew.Instituicao> GetInstituicaos()
    {
      var items = this.context.Instituicaos.AsQueryable<Models.ProjetoNew.Instituicao>();
      this.OnInstituicaosRead(ref items);

      return items;
    }

    partial void OnInstituicaosRead(ref IQueryable<Models.ProjetoNew.Instituicao> items);

    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet("{Num_Inst}")]
    public SingleResult<Instituicao> GetInstituicao(int key)
    {
        var items = this.context.Instituicaos.Where(i=>i.Num_Inst == key);
        this.OnInstituicaosGet(ref items);

        return SingleResult.Create(items);
    }

    partial void OnInstituicaosGet(ref IQueryable<Models.ProjetoNew.Instituicao> items);

    partial void OnInstituicaoDeleted(Models.ProjetoNew.Instituicao item);

    [HttpDelete("{Num_Inst}")]
    public IActionResult DeleteInstituicao(int key)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }


            var item = this.context.Instituicaos
                .Where(i => i.Num_Inst == key)
                .Include(i => i.Pertencers)
                .Include(i => i.Pessoas)
                .FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            this.OnInstituicaoDeleted(item);
            this.context.Instituicaos.Remove(item);
            this.context.SaveChanges();

            return new NoContentResult();
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnInstituicaoUpdated(Models.ProjetoNew.Instituicao item);

    [HttpPut("{Num_Inst}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PutInstituicao(int key, [FromBody]Models.ProjetoNew.Instituicao newItem)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (newItem == null || (newItem.Num_Inst != key))
            {
                return BadRequest();
            }

            this.OnInstituicaoUpdated(newItem);
            this.context.Instituicaos.Update(newItem);
            this.context.SaveChanges();

            var itemToReturn = this.context.Instituicaos.Where(i => i.Num_Inst == key);
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    [HttpPatch("{Num_Inst}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PatchInstituicao(int key, [FromBody]Delta<Models.ProjetoNew.Instituicao> patch)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var item = this.context.Instituicaos.Where(i => i.Num_Inst == key).FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            patch.Patch(item);

            this.OnInstituicaoUpdated(item);
            this.context.Instituicaos.Update(item);
            this.context.SaveChanges();

            var itemToReturn = this.context.Instituicaos.Where(i => i.Num_Inst == key);
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnInstituicaoCreated(Models.ProjetoNew.Instituicao item);

    [HttpPost]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult Post([FromBody] Models.ProjetoNew.Instituicao item)
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

            this.OnInstituicaoCreated(item);
            this.context.Instituicaos.Add(item);
            this.context.SaveChanges();

            return Created($"odata/ProjetoNew/Instituicaos/{item.Num_Inst}", item);
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }
  }
}
