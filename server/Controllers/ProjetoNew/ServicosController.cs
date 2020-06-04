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

  [ODataRoutePrefix("odata/ProjetoNew/Servicos")]
  [Route("mvc/odata/ProjetoNew/Servicos")]
  public partial class ServicosController : ODataController
  {
    private Data.ProjetoNewContext context;

    public ServicosController(Data.ProjetoNewContext context)
    {
      this.context = context;
    }
    // GET /odata/ProjetoNew/Servicos
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet]
    public IEnumerable<Models.ProjetoNew.Servico> GetServicos()
    {
      var items = this.context.Servicos.AsQueryable<Models.ProjetoNew.Servico>();
      this.OnServicosRead(ref items);

      return items;
    }

    partial void OnServicosRead(ref IQueryable<Models.ProjetoNew.Servico> items);

    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet("{index_servicos}")]
    public SingleResult<Servico> GetServico(int key)
    {
        var items = this.context.Servicos.Where(i=>i.index_servicos == key);
        this.OnServicosGet(ref items);

        return SingleResult.Create(items);
    }

    partial void OnServicosGet(ref IQueryable<Models.ProjetoNew.Servico> items);

    partial void OnServicoDeleted(Models.ProjetoNew.Servico item);

    [HttpDelete("{index_servicos}")]
    public IActionResult DeleteServico(int key)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }


            var item = this.context.Servicos
                .Where(i => i.index_servicos == key)
                .Include(i => i.EstaAtribuidos)
                .Include(i => i.Pessoas)
                .Include(i => i.Pedes)
                .FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            this.OnServicoDeleted(item);
            this.context.Servicos.Remove(item);
            this.context.SaveChanges();

            return new NoContentResult();
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnServicoUpdated(Models.ProjetoNew.Servico item);

    [HttpPut("{index_servicos}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PutServico(int key, [FromBody]Models.ProjetoNew.Servico newItem)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (newItem == null || (newItem.index_servicos != key))
            {
                return BadRequest();
            }

            this.OnServicoUpdated(newItem);
            this.context.Servicos.Update(newItem);
            this.context.SaveChanges();

            var itemToReturn = this.context.Servicos.Where(i => i.index_servicos == key);
            Request.QueryString = Request.QueryString.Add("$expand", "Gt");
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    [HttpPatch("{index_servicos}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PatchServico(int key, [FromBody]Delta<Models.ProjetoNew.Servico> patch)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var item = this.context.Servicos.Where(i => i.index_servicos == key).FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            patch.Patch(item);

            this.OnServicoUpdated(item);
            this.context.Servicos.Update(item);
            this.context.SaveChanges();

            var itemToReturn = this.context.Servicos.Where(i => i.index_servicos == key);
            Request.QueryString = Request.QueryString.Add("$expand", "Gt");
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnServicoCreated(Models.ProjetoNew.Servico item);

    [HttpPost]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult Post([FromBody] Models.ProjetoNew.Servico item)
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

            this.OnServicoCreated(item);
            this.context.Servicos.Add(item);
            this.context.SaveChanges();

            var key = item.index_servicos;

            var itemToReturn = this.context.Servicos.Where(i => i.index_servicos == key);

            Request.QueryString = Request.QueryString.Add("$expand", "Gt");

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
