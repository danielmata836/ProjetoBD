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
      var items = this.context.Formacaos.AsNoTracking().AsQueryable<Models.ProjetoNew.Formacao>();
      this.OnFormacaosRead(ref items);

      return items;
    }

    partial void OnFormacaosRead(ref IQueryable<Models.ProjetoNew.Formacao> items);

    [EnableQuery(MaxExpansionDepth=10,MaxAnyAllExpressionDepth=10,MaxNodeCount=1000)]
    [HttpGet("{tipo_formacao}")]
    public SingleResult<Formacao> GetFormacao(string key)
    {
        var items = this.context.Formacaos.AsNoTracking().Where(i=>i.tipo_formacao == key);
        this.OnFormacaosGet(ref items);

        return SingleResult.Create(items);
    }

    partial void OnFormacaosGet(ref IQueryable<Models.ProjetoNew.Formacao> items);

  }
}
