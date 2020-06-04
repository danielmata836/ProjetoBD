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

  [ODataRoutePrefix("odata/ProjetoNew/Equipamentos")]
  [Route("mvc/odata/ProjetoNew/Equipamentos")]
  public partial class EquipamentosController : ODataController
  {
    private Data.ProjetoNewContext context;

    public EquipamentosController(Data.ProjetoNewContext context)
    {
      this.context = context;
    }
    // GET /odata/ProjetoNew/Equipamentos
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet]
    public IEnumerable<Models.ProjetoNew.Equipamento> GetEquipamentos()
    {
      var items = this.context.Equipamentos.AsQueryable<Models.ProjetoNew.Equipamento>();
      this.OnEquipamentosRead(ref items);

      return items;
    }

    partial void OnEquipamentosRead(ref IQueryable<Models.ProjetoNew.Equipamento> items);

    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet("{no_regis_produto}")]
    public SingleResult<Equipamento> GetEquipamento(int key)
    {
        var items = this.context.Equipamentos.Where(i=>i.no_regis_produto == key);
        this.OnEquipamentosGet(ref items);

        return SingleResult.Create(items);
    }

    partial void OnEquipamentosGet(ref IQueryable<Models.ProjetoNew.Equipamento> items);

    partial void OnEquipamentoDeleted(Models.ProjetoNew.Equipamento item);

    [HttpDelete("{no_regis_produto}")]
    public IActionResult DeleteEquipamento(int key)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }


            var item = this.context.Equipamentos
                .Where(i => i.no_regis_produto == key)
                .Include(i => i.Pertencers)
                .FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            this.OnEquipamentoDeleted(item);
            this.context.Equipamentos.Remove(item);
            this.context.SaveChanges();

            return new NoContentResult();
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnEquipamentoUpdated(Models.ProjetoNew.Equipamento item);

    [HttpPut("{no_regis_produto}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PutEquipamento(int key, [FromBody]Models.ProjetoNew.Equipamento newItem)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (newItem == null || (newItem.no_regis_produto != key))
            {
                return BadRequest();
            }

            this.OnEquipamentoUpdated(newItem);
            this.context.Equipamentos.Update(newItem);
            this.context.SaveChanges();

            var itemToReturn = this.context.Equipamentos.Where(i => i.no_regis_produto == key);
            Request.QueryString = Request.QueryString.Add("$expand", "Recurso");
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    [HttpPatch("{no_regis_produto}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PatchEquipamento(int key, [FromBody]Delta<Models.ProjetoNew.Equipamento> patch)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var item = this.context.Equipamentos.Where(i => i.no_regis_produto == key).FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            patch.Patch(item);

            this.OnEquipamentoUpdated(item);
            this.context.Equipamentos.Update(item);
            this.context.SaveChanges();

            var itemToReturn = this.context.Equipamentos.Where(i => i.no_regis_produto == key);
            Request.QueryString = Request.QueryString.Add("$expand", "Recurso");
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnEquipamentoCreated(Models.ProjetoNew.Equipamento item);

    [HttpPost]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult Post([FromBody] Models.ProjetoNew.Equipamento item)
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

            this.OnEquipamentoCreated(item);
            this.context.Equipamentos.Add(item);
            this.context.SaveChanges();

            var key = item.no_regis_produto;

            var itemToReturn = this.context.Equipamentos.Where(i => i.no_regis_produto == key);

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
