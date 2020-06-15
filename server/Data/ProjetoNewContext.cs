using System.Reflection;
using System.Linq;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

using ProjetoNew.Models.ProjetoNew;

namespace ProjetoNew.Data
{
    public partial class ProjetoNewContext : Microsoft.EntityFrameworkCore.DbContext
    {
        private readonly IHttpContextAccessor httpAccessor;

        public ProjetoNewContext(IHttpContextAccessor httpAccessor, DbContextOptions<ProjetoNewContext> options):base(options)
        {
            this.httpAccessor = httpAccessor;
        }

        public ProjetoNewContext(IHttpContextAccessor httpAccessor)
        {
            this.httpAccessor = httpAccessor;
        }

        partial void OnModelBuilding(ModelBuilder builder);

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            builder.Entity<ProjetoNew.Models.ProjetoNew.Formacao>()
                  .HasOne(i => i.Recurso)
                  .WithMany(i => i.Formacaos)
                  .HasForeignKey(i => i.index_Recurso)
                  .HasPrincipalKey(i => i.index_Recurso);
            builder.Entity<ProjetoNew.Models.ProjetoNew.Produto>()
                  .HasOne(i => i.Recurso)
                  .WithMany(i => i.Produtos)
                  .HasForeignKey(i => i.index_Recurso)
                  .HasPrincipalKey(i => i.index_Recurso);


            this.OnModelBuilding(builder);
        }


        public DbSet<ProjetoNew.Models.ProjetoNew.Formacao> Formacaos
        {
          get;
          set;
        }

        public DbSet<ProjetoNew.Models.ProjetoNew.Produto> Produtos
        {
          get;
          set;
        }

        public DbSet<ProjetoNew.Models.ProjetoNew.Recurso> Recursos
        {
          get;
          set;
        }
    }
}
