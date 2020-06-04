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

  [ODataRoutePrefix("odata/ProjetoNew/Pedes")]
  [Route("mvc/odata/ProjetoNew/Pedes")]
  public partial class PedesController : ODataController
  {
    private Data.ProjetoNewContext context;

    public PedesController(Data.ProjetoNewContext context)
    {
      this.context = context;
    }
    // GET /odata/ProjetoNew/Pedes
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet]
    public IEnumerable<Models.ProjetoNew.Pede> GetPedes()
    {
      var items = this.context.Pedes.AsQueryable<Models.ProjetoNew.Pede>();
      this.OnPedesRead(ref items);

      return items;
    }

    partial void OnPedesRead(ref IQueryable<Models.ProjetoNew.Pede> items);

    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet("{id_Pessoa},{index_servicos}")]
    public SingleResult<Pede> GetPede([FromODataUri] int keyid_Pessoa,[FromODataUri] int keyindex_servicos)
    {
        var items = this.context.Pedes.Where(i=>i.id_Pessoa == keyid_Pessoa && i.index_servicos == keyindex_servicos);
        this.OnPedesGet(ref items);

        return SingleResult.Create(items);
    }

    partial void OnPedesGet(ref IQueryable<Models.ProjetoNew.Pede> items);

    partial void OnPedeDeleted(Models.ProjetoNew.Pede item);

    [HttpDelete("{id_Pessoa},{index_servicos}")]
    public IActionResult DeletePede([FromODataUri] int keyid_Pessoa,[FromODataUri] int keyindex_servicos)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }


            var item = this.context.Pedes
                .Where(i => i.id_Pessoa == keyid_Pessoa && i.index_servicos == keyindex_servicos)
                .FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            this.OnPedeDeleted(item);
            this.context.Pedes.Remove(item);
            this.context.SaveChanges();

            return new NoContentResult();
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnPedeUpdated(Models.ProjetoNew.Pede item);

    [HttpPut("{id_Pessoa},{index_servicos}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PutPede([FromODataUri] int keyid_Pessoa,[FromODataUri] int keyindex_servicos, [FromBody]Models.ProjetoNew.Pede newItem)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (newItem == null || (newItem.id_Pessoa != keyid_Pessoa && newItem.index_servicos != keyindex_servicos))
            {
                return BadRequest();
            }

            this.OnPedeUpdated(newItem);
            this.context.Pedes.Update(newItem);
            this.context.SaveChanges();

            var itemToReturn = this.context.Pedes.Where(i => i.id_Pessoa == keyid_Pessoa && i.index_servicos == keyindex_servicos);
            Request.QueryString = Request.QueryString.Add("$expand", "Pessoa,Servico");
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    [HttpPatch("{id_Pessoa},{index_servicos}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PatchPede([FromODataUri] int keyid_Pessoa,[FromODataUri] int keyindex_servicos, [FromBody]Delta<Models.ProjetoNew.Pede> patch)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var item = this.context.Pedes.Where(i => i.id_Pessoa == keyid_Pessoa && i.index_servicos == keyindex_servicos).FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            patch.Patch(item);

            this.OnPedeUpdated(item);
            this.context.Pedes.Update(item);
            this.context.SaveChanges();

            var itemToReturn = this.context.Pedes.Where(i => i.id_Pessoa == keyid_Pessoa && i.index_servicos == keyindex_servicos);
            Request.QueryString = Request.QueryString.Add("$expand", "Pessoa,Servico");
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnPedeCreated(Models.ProjetoNew.Pede item);

    [HttpPost]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult Post([FromBody] Models.ProjetoNew.Pede item)
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

            this.OnPedeCreated(item);
            this.context.Pedes.Add(item);
            this.context.SaveChanges();

            var keyid_Pessoa = item.id_Pessoa;
            var keyindex_servicos = item.index_servicos;

            var itemToReturn = this.context.Pedes.Where(i => i.id_Pessoa == keyid_Pessoa && i.index_servicos == keyindex_servicos);

            Request.QueryString = Request.QueryString.Add("$expand", "Pessoa,Servico");

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
