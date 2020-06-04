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

  [ODataRoutePrefix("odata/ProjetoNew/PertenceUis")]
  [Route("mvc/odata/ProjetoNew/PertenceUis")]
  public partial class PertenceUisController : ODataController
  {
    private Data.ProjetoNewContext context;

    public PertenceUisController(Data.ProjetoNewContext context)
    {
      this.context = context;
    }
    // GET /odata/ProjetoNew/PertenceUis
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet]
    public IEnumerable<Models.ProjetoNew.PertenceUi> GetPertenceUis()
    {
      var items = this.context.PertenceUis.AsQueryable<Models.ProjetoNew.PertenceUi>();
      this.OnPertenceUisRead(ref items);

      return items;
    }

    partial void OnPertenceUisRead(ref IQueryable<Models.ProjetoNew.PertenceUi> items);

    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet("{id_UI},{id_Pessoa}")]
    public SingleResult<PertenceUi> GetPertenceUi([FromODataUri] int keyid_UI,[FromODataUri] int keyid_Pessoa)
    {
        var items = this.context.PertenceUis.Where(i=>i.id_UI == keyid_UI && i.id_Pessoa == keyid_Pessoa);
        this.OnPertenceUisGet(ref items);

        return SingleResult.Create(items);
    }

    partial void OnPertenceUisGet(ref IQueryable<Models.ProjetoNew.PertenceUi> items);

    partial void OnPertenceUiDeleted(Models.ProjetoNew.PertenceUi item);

    [HttpDelete("{id_UI},{id_Pessoa}")]
    public IActionResult DeletePertenceUi([FromODataUri] int keyid_UI,[FromODataUri] int keyid_Pessoa)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }


            var item = this.context.PertenceUis
                .Where(i => i.id_UI == keyid_UI && i.id_Pessoa == keyid_Pessoa)
                .FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            this.OnPertenceUiDeleted(item);
            this.context.PertenceUis.Remove(item);
            this.context.SaveChanges();

            return new NoContentResult();
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnPertenceUiUpdated(Models.ProjetoNew.PertenceUi item);

    [HttpPut("{id_UI},{id_Pessoa}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PutPertenceUi([FromODataUri] int keyid_UI,[FromODataUri] int keyid_Pessoa, [FromBody]Models.ProjetoNew.PertenceUi newItem)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (newItem == null || (newItem.id_UI != keyid_UI && newItem.id_Pessoa != keyid_Pessoa))
            {
                return BadRequest();
            }

            this.OnPertenceUiUpdated(newItem);
            this.context.PertenceUis.Update(newItem);
            this.context.SaveChanges();

            var itemToReturn = this.context.PertenceUis.Where(i => i.id_UI == keyid_UI && i.id_Pessoa == keyid_Pessoa);
            Request.QueryString = Request.QueryString.Add("$expand", "Ui,Pessoa");
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    [HttpPatch("{id_UI},{id_Pessoa}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PatchPertenceUi([FromODataUri] int keyid_UI,[FromODataUri] int keyid_Pessoa, [FromBody]Delta<Models.ProjetoNew.PertenceUi> patch)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var item = this.context.PertenceUis.Where(i => i.id_UI == keyid_UI && i.id_Pessoa == keyid_Pessoa).FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            patch.Patch(item);

            this.OnPertenceUiUpdated(item);
            this.context.PertenceUis.Update(item);
            this.context.SaveChanges();

            var itemToReturn = this.context.PertenceUis.Where(i => i.id_UI == keyid_UI && i.id_Pessoa == keyid_Pessoa);
            Request.QueryString = Request.QueryString.Add("$expand", "Ui,Pessoa");
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnPertenceUiCreated(Models.ProjetoNew.PertenceUi item);

    [HttpPost]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult Post([FromBody] Models.ProjetoNew.PertenceUi item)
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

            this.OnPertenceUiCreated(item);
            this.context.PertenceUis.Add(item);
            this.context.SaveChanges();

            var keyid_UI = item.id_UI;
            var keyid_Pessoa = item.id_Pessoa;

            var itemToReturn = this.context.PertenceUis.Where(i => i.id_UI == keyid_UI && i.id_Pessoa == keyid_Pessoa);

            Request.QueryString = Request.QueryString.Add("$expand", "Ui,Pessoa");

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
