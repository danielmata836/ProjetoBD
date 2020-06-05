using System;
using System.IO;
using System.Text;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Reflection;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.AspNet.OData.Extensions;
using Microsoft.AspNet.OData;
using Microsoft.AspNet.OData.Builder;
using Microsoft.IdentityModel.Tokens;
using Microsoft.AspNetCore.SpaServices.AngularCli;
using Microsoft.Extensions.Hosting;

using ProjetoNew.Data;
using ProjetoNew.Models;
using ProjetoNew.Authentication;

namespace ProjetoNew
{
  public partial class Startup
  {
    public Startup(IConfiguration configuration, IWebHostEnvironment env)
    {
        Configuration = configuration;
    }

    public IConfiguration Configuration { get; }

    partial void OnConfigureServices(IServiceCollection services);

    partial void OnConfiguringServices(IServiceCollection services);

    public void ConfigureServices(IServiceCollection services)
    {
      OnConfiguringServices(services);

      services.AddOptions();
      services.AddLogging(logging =>
      {
          logging.AddConsole();
          logging.AddDebug();
      });

      services.AddCors(options =>
      {
          options.AddPolicy(
              "AllowAny",
              x =>
              {
                  x.AllowAnyHeader()
                  .AllowAnyMethod()
                  .SetIsOriginAllowed(isOriginAllowed: _ => true)
                  .AllowCredentials();
              });
      });
      services.AddMvc(options =>
      {
          options.EnableEndpointRouting = false;

          options.OutputFormatters.Add(new ProjetoNew.Data.XlsDataContractSerializerOutputFormatter());
          options.FormatterMappings.SetMediaTypeMappingForFormat("xlsx", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

          options.OutputFormatters.Add(new ProjetoNew.Data.CsvDataContractSerializerOutputFormatter());
          options.FormatterMappings.SetMediaTypeMappingForFormat("csv", "text/csv");
      }).AddNewtonsoftJson();

      services.AddAuthorization();
      services.AddOData();
      services.AddODataQueryFilter();
      services.AddHttpContextAccessor();

      var tokenValidationParameters = new TokenValidationParameters
      {
          ValidateIssuerSigningKey = true,
          IssuerSigningKey = TokenProviderOptions.Key,
          ValidateIssuer = true,
          ValidIssuer = TokenProviderOptions.Issuer,
          ValidateAudience = true,
          ValidAudience = TokenProviderOptions.Audience,
          ValidateLifetime = true,
          ClockSkew = TimeSpan.Zero
      };

      services.AddAuthentication(options =>
      {
          options.DefaultScheme = Microsoft.AspNetCore.Authentication.JwtBearer.JwtBearerDefaults.AuthenticationScheme;
      }).AddJwtBearer(options =>
      {
          options.Audience = TokenProviderOptions.Audience;
          options.ClaimsIssuer = TokenProviderOptions.Issuer;
          options.TokenValidationParameters = tokenValidationParameters;
          options.SaveToken = true;
      });
      services.AddDbContext<ApplicationIdentityDbContext>(options =>
      {
         options.UseSqlServer(Configuration.GetConnectionString("ProjetoNewConnection"));
      });

      services.AddIdentity<ApplicationUser, IdentityRole>()
            .AddEntityFrameworkStores<ApplicationIdentityDbContext>();

      services.AddScoped<IUserClaimsPrincipalFactory<ApplicationUser>, ApplicationPrincipalFactory>();


      services.AddDbContext<ProjetoNew.Data.ProjetoNewContext>(options =>
      {
        options.UseSqlServer(Configuration.GetConnectionString("ProjetoNewConnection"));
      });

      OnConfigureServices(services);
    }

    partial void OnConfigure(IApplicationBuilder app);


    partial void OnConfigure(IApplicationBuilder app, IWebHostEnvironment env);
    partial void OnConfiguring(IApplicationBuilder app, IWebHostEnvironment env);
    partial void OnConfigureOData(ODataConventionModelBuilder builder);

    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
    {

      OnConfiguring(app, env);

      IServiceProvider provider = app.ApplicationServices.GetRequiredService<IServiceProvider>();
      app.UseCors("AllowAny");
      app.Use(async (context, next) => {
          if (context.Request.Path.Value == "/__ssrsreport" || context.Request.Path.Value == "/ssrsproxy") {
            await next();
            return;
          }
          await next();
          if ((context.Response.StatusCode == 404 || context.Response.StatusCode == 401) && !Path.HasExtension(context.Request.Path.Value)) {
              context.Request.Path = "/index.html";
              await next();
          }
      });

      app.UseDefaultFiles();
      app.UseStaticFiles();

      app.UseDeveloperExceptionPage();

      app.UseMvc(builder =>
      {
          builder.Count().Filter().OrderBy().Expand().Select().MaxTop(null).SetTimeZoneInfo(TimeZoneInfo.Utc);

          if (env.EnvironmentName == "Development")
          {
              builder.MapRoute(name: "default",
                template: "{controller}/{action}/{id?}",
                defaults: new { controller = "Home", action = "Index" }
              );
          }

          var oDataBuilder = new ODataConventionModelBuilder(provider);

          oDataBuilder.EntitySet<ProjetoNew.Models.ProjetoNew.Equipamento>("Equipamentos");

          var estaAtribuidoEntitySet = oDataBuilder.EntitySet<ProjetoNew.Models.ProjetoNew.EstaAtribuido>("EstaAtribuidos");
          estaAtribuidoEntitySet.EntityType.HasKey(entity => new {
            entity.index_Recurso, entity.index_servicos
          });
          oDataBuilder.EntitySet<ProjetoNew.Models.ProjetoNew.Formacao>("Formacaos");
          oDataBuilder.EntitySet<ProjetoNew.Models.ProjetoNew.Gt>("Gts");
          oDataBuilder.EntitySet<ProjetoNew.Models.ProjetoNew.Instituicao>("Instituicaos");

          var pedeEntitySet = oDataBuilder.EntitySet<ProjetoNew.Models.ProjetoNew.Pede>("Pedes");
          pedeEntitySet.EntityType.HasKey(entity => new {
            entity.id_Pessoa, entity.index_servicos
          });

          var pertenceUiEntitySet = oDataBuilder.EntitySet<ProjetoNew.Models.ProjetoNew.PertenceUi>("PertenceUis");
          pertenceUiEntitySet.EntityType.HasKey(entity => new {
            entity.id_UI, entity.id_Pessoa
          });

          var pertencerEntitySet = oDataBuilder.EntitySet<ProjetoNew.Models.ProjetoNew.Pertencer>("Pertencers");
          pertencerEntitySet.EntityType.HasKey(entity => new {
            entity.Num_Inst, entity.no_regis_produto
          });
          oDataBuilder.EntitySet<ProjetoNew.Models.ProjetoNew.Pessoa>("Pessoas");
          oDataBuilder.EntitySet<ProjetoNew.Models.ProjetoNew.Produto>("Produtos");
          oDataBuilder.EntitySet<ProjetoNew.Models.ProjetoNew.Recurso>("Recursos");
          oDataBuilder.EntitySet<ProjetoNew.Models.ProjetoNew.Servico>("Servicos");
          oDataBuilder.EntitySet<ProjetoNew.Models.ProjetoNew.Ui>("Uis");

          this.OnConfigureOData(oDataBuilder);

          oDataBuilder.EntitySet<ApplicationUser>("ApplicationUsers");
          var usersType = oDataBuilder.StructuralTypes.First(x => x.ClrType == typeof(ApplicationUser));
          usersType.AddCollectionProperty(typeof(ApplicationUser).GetProperty("RoleNames"));
          oDataBuilder.EntitySet<IdentityRole>("ApplicationRoles");

          var model = oDataBuilder.GetEdmModel();

          builder.MapODataServiceRoute("odata/ProjetoNew", "odata/ProjetoNew", model);

          builder.MapODataServiceRoute("auth", "auth", model);
      });

      if (string.IsNullOrEmpty(Environment.GetEnvironmentVariable("RADZEN")) && env.IsDevelopment())
      {
        app.UseSpa(spa =>
        {
          spa.Options.SourcePath = "../client";
          spa.UseAngularCliServer(npmScript: "start -- --port 8000 --open");
        });
      }

      OnConfigure(app);
      OnConfigure(app, env);
    }
  }
}
