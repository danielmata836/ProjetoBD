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

  [ODataRoutePrefix("odata/ProjetoNew/Pertencers")]
  [Route("mvc/odata/ProjetoNew/Pertencers")]
  public partial class PertencersController : ODataController
  {
    private Data.ProjetoNewContext context;

    public PertencersController(Data.ProjetoNewContext context)
    {
      this.context = context;
    }
    // GET /odata/ProjetoNew/Pertencers
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet]
    public IEnumerable<Models.ProjetoNew.Pertencer> GetPertencers()
    {
      var items = this.context.Pertencers.AsQueryable<Models.ProjetoNew.Pertencer>();
      this.OnPertencersRead(ref items);

      return items;
    }

    partial void OnPertencersRead(ref IQueryable<Models.ProjetoNew.Pertencer> items);

    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet("{Num_Inst},{no_regis_produto}")]
    public SingleResult<Pertencer> GetPertencer([FromODataUri] int keyNum_Inst,[FromODataUri] int keyno_regis_produto)
    {
        var items = this.context.Pertencers.Where(i=>i.Num_Inst == keyNum_Inst && i.no_regis_produto == keyno_regis_produto);
        this.OnPertencersGet(ref items);

        return SingleResult.Create(items);
    }

    partial void OnPertencersGet(ref IQueryable<Models.ProjetoNew.Pertencer> items);

    partial void OnPertencerDeleted(Models.ProjetoNew.Pertencer item);

    [HttpDelete("{Num_Inst},{no_regis_produto}")]
    public IActionResult DeletePertencer([FromODataUri] int keyNum_Inst,[FromODataUri] int keyno_regis_produto)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }


            var item = this.context.Pertencers
                .Where(i => i.Num_Inst == keyNum_Inst && i.no_regis_produto == keyno_regis_produto)
                .FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            this.OnPertencerDeleted(item);
            this.context.Pertencers.Remove(item);
            this.context.SaveChanges();

            return new NoContentResult();
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnPertencerUpdated(Models.ProjetoNew.Pertencer item);

    [HttpPut("{Num_Inst},{no_regis_produto}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PutPertencer([FromODataUri] int keyNum_Inst,[FromODataUri] int keyno_regis_produto, [FromBody]Models.ProjetoNew.Pertencer newItem)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (newItem == null || (newItem.Num_Inst != keyNum_Inst && newItem.no_regis_produto != keyno_regis_produto))
            {
                return BadRequest();
            }

            this.OnPertencerUpdated(newItem);
            this.context.Pertencers.Update(newItem);
            this.context.SaveChanges();

            var itemToReturn = this.context.Pertencers.Where(i => i.Num_Inst == keyNum_Inst && i.no_regis_produto == keyno_regis_produto);
            Request.QueryString = Request.QueryString.Add("$expand", "Instituicao,Equipamento");
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    [HttpPatch("{Num_Inst},{no_regis_produto}")]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult PatchPertencer([FromODataUri] int keyNum_Inst,[FromODataUri] int keyno_regis_produto, [FromBody]Delta<Models.ProjetoNew.Pertencer> patch)
    {
        try
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var item = this.context.Pertencers.Where(i => i.Num_Inst == keyNum_Inst && i.no_regis_produto == keyno_regis_produto).FirstOrDefault();

            if (item == null)
            {
                ModelState.AddModelError("", "Item no longer available");
                return BadRequest(ModelState);
            }

            patch.Patch(item);

            this.OnPertencerUpdated(item);
            this.context.Pertencers.Update(item);
            this.context.SaveChanges();

            var itemToReturn = this.context.Pertencers.Where(i => i.Num_Inst == keyNum_Inst && i.no_regis_produto == keyno_regis_produto);
            Request.QueryString = Request.QueryString.Add("$expand", "Instituicao,Equipamento");
            return new ObjectResult(SingleResult.Create(itemToReturn));
        }
        catch(Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return BadRequest(ModelState);
        }
    }

    partial void OnPertencerCreated(Models.ProjetoNew.Pertencer item);

    [HttpPost]
    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    public IActionResult Post([FromBody] Models.ProjetoNew.Pertencer item)
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

            this.OnPertencerCreated(item);
            this.context.Pertencers.Add(item);
            this.context.SaveChanges();

            var keyNum_Inst = item.Num_Inst;
            var keyno_regis_produto = item.no_regis_produto;

            var itemToReturn = this.context.Pertencers.Where(i => i.Num_Inst == keyNum_Inst && i.no_regis_produto == keyno_regis_produto);

            Request.QueryString = Request.QueryString.Add("$expand", "Instituicao,Equipamento");

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
