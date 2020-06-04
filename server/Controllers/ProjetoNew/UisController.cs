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

  [ODataRoutePrefix("odata/ProjetoNew/Uis")]
  [Route("mvc/odata/ProjetoNew/Uis")]
  public partial class UisController : ODataController
  {
    private Data.ProjetoNewContext context;

    public UisController(Data.ProjetoNewContext context)
    {
      this.context = context;
    }
    // GET /odata/ProjetoNew/Uis
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet]
    public IEnumerable<Models.ProjetoNew.Ui> GetUis()
    {
      var items = this.context.Uis.AsQueryable<Models.ProjetoNew.Ui>();
      this.OnUisRead(ref items);

      return items;
    }

    partial void OnUisRead(ref IQueryable<Models.ProjetoNew.Ui> items);

    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet("{id_UI}")]
    public SingleResult<Ui> GetUi(int key)
    {
        var items = this.context.Uis.Where(i=>i.id_UI == key);
        this.OnUisGet(ref items);

        return SingleResult.Create(items);
    }

    partial void OnUisGet(ref IQueryable<Models.ProjetoNew.Ui> items);

    partial void OnUiDeleted(Models.ProjetoNew.Ui item);

    [HttpDelete("{id_UI}")]
    public IActionResult DeleteUi(int key)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }


            var item = this.context.Uis
                .Where(i => i.id_UI == key)
                .Include(i => i.PertenceUis)
                .FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            this.OnUiDeleted(item);
            this.context.Uis.Remove(item);
            this.context.SaveChanges();

            return new NoContentResult();
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnUiUpdated(Models.ProjetoNew.Ui item);

    [HttpPut("{id_UI}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PutUi(int key, [FromBody]Models.ProjetoNew.Ui newItem)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (newItem == null || (newItem.id_UI != key))
            {
                return BadRequest();
            }

            this.OnUiUpdated(newItem);
            this.context.Uis.Update(newItem);
            this.context.SaveChanges();

            var itemToReturn = this.context.Uis.Where(i => i.id_UI == key);
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    [HttpPatch("{id_UI}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PatchUi(int key, [FromBody]Delta<Models.ProjetoNew.Ui> patch)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var item = this.context.Uis.Where(i => i.id_UI == key).FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            patch.Patch(item);

            this.OnUiUpdated(item);
            this.context.Uis.Update(item);
            this.context.SaveChanges();

            var itemToReturn = this.context.Uis.Where(i => i.id_UI == key);
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnUiCreated(Models.ProjetoNew.Ui item);

    [HttpPost]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult Post([FromBody] Models.ProjetoNew.Ui item)
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

            this.OnUiCreated(item);
            this.context.Uis.Add(item);
            this.context.SaveChanges();

            return Created($"odata/ProjetoNew/Uis/{item.id_UI}", item);
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }
  }
}
