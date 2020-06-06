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

            builder.Entity<ProjetoNew.Models.ProjetoNew.EstaAtribuido>().HasKey(table => new {
              table.index_Recurso, table.index_servicos
            });
            builder.Entity<ProjetoNew.Models.ProjetoNew.Pede>().HasKey(table => new {
              table.id_Pessoa, table.index_servicos
            });
            builder.Entity<ProjetoNew.Models.ProjetoNew.PertenceUi>().HasKey(table => new {
              table.id_UI, table.id_Pessoa
            });
            builder.Entity<ProjetoNew.Models.ProjetoNew.Pertencer>().HasKey(table => new {
              table.Num_Inst, table.no_regis_produto
            });
            builder.Entity<ProjetoNew.Models.ProjetoNew.Equipamento>()
                  .HasOne(i => i.Recurso)
                  .WithMany(i => i.Equipamentos)
                  .HasForeignKey(i => i.index_Recurso)
                  .HasPrincipalKey(i => i.index_Recurso);
            builder.Entity<ProjetoNew.Models.ProjetoNew.EstaAtribuido>()
                  .HasOne(i => i.Recurso)
                  .WithMany(i => i.EstaAtribuidos)
                  .HasForeignKey(i => i.index_Recurso)
                  .HasPrincipalKey(i => i.index_Recurso);
            builder.Entity<ProjetoNew.Models.ProjetoNew.EstaAtribuido>()
                  .HasOne(i => i.Servico)
                  .WithMany(i => i.EstaAtribuidos)
                  .HasForeignKey(i => i.index_servicos)
                  .HasPrincipalKey(i => i.index_servicos);
            builder.Entity<ProjetoNew.Models.ProjetoNew.Pede>()
                  .HasOne(i => i.Pessoa)
                  .WithMany(i => i.Pedes)
                  .HasForeignKey(i => i.id_Pessoa)
                  .HasPrincipalKey(i => i.id_Pessoa);
            builder.Entity<ProjetoNew.Models.ProjetoNew.Pede>()
                  .HasOne(i => i.Servico)
                  .WithMany(i => i.Pedes)
                  .HasForeignKey(i => i.index_servicos)
                  .HasPrincipalKey(i => i.index_servicos);
            builder.Entity<ProjetoNew.Models.ProjetoNew.PertenceUi>()
                  .HasOne(i => i.Ui)
                  .WithMany(i => i.PertenceUis)
                  .HasForeignKey(i => i.id_UI)
                  .HasPrincipalKey(i => i.id_UI);
            builder.Entity<ProjetoNew.Models.ProjetoNew.PertenceUi>()
                  .HasOne(i => i.Pessoa)
                  .WithMany(i => i.PertenceUis)
                  .HasForeignKey(i => i.id_Pessoa)
                  .HasPrincipalKey(i => i.id_Pessoa);
            builder.Entity<ProjetoNew.Models.ProjetoNew.Pertencer>()
                  .HasOne(i => i.Instituicao)
                  .WithMany(i => i.Pertencers)
                  .HasForeignKey(i => i.Num_Inst)
                  .HasPrincipalKey(i => i.Num_Inst);
            builder.Entity<ProjetoNew.Models.ProjetoNew.Pertencer>()
                  .HasOne(i => i.Equipamento)
                  .WithMany(i => i.Pertencers)
                  .HasForeignKey(i => i.no_regis_produto)
                  .HasPrincipalKey(i => i.no_regis_produto);
            builder.Entity<ProjetoNew.Models.ProjetoNew.Pessoa>()
                  .HasOne(i => i.Servico)
                  .WithMany(i => i.Pessoas)
                  .HasForeignKey(i => i.index_servicos)
                  .HasPrincipalKey(i => i.index_servicos);
            builder.Entity<ProjetoNew.Models.ProjetoNew.Pessoa>()
                  .HasOne(i => i.Instituicao)
                  .WithMany(i => i.Pessoas)
                  .HasForeignKey(i => i.Num_Inst)
                  .HasPrincipalKey(i => i.Num_Inst);
            builder.Entity<ProjetoNew.Models.ProjetoNew.Pessoa>()
                  .HasOne(i => i.Gt)
                  .WithMany(i => i.Pessoas)
                  .HasForeignKey(i => i.id_GT)
                  .HasPrincipalKey(i => i.id_GT);
            builder.Entity<ProjetoNew.Models.ProjetoNew.Servico>()
                  .HasOne(i => i.Gt)
                  .WithMany(i => i.Servicos)
                  .HasForeignKey(i => i.id_GT)
                  .HasPrincipalKey(i => i.id_GT);


            builder.Entity<ProjetoNew.Models.ProjetoNew.Equipamento>()
                  .Property(p => p.garantia)
                  .HasColumnType("date");

            builder.Entity<ProjetoNew.Models.ProjetoNew.Servico>()
                  .Property(p => p.data_inicio)
                  .HasColumnType("date");

            builder.Entity<ProjetoNew.Models.ProjetoNew.Servico>()
                  .Property(p => p.data_fim)
                  .HasColumnType("date");

            this.OnModelBuilding(builder);
        }


        public DbSet<ProjetoNew.Models.ProjetoNew.Equipamento> Equipamentos
        {
          get;
          set;
        }

        public DbSet<ProjetoNew.Models.ProjetoNew.EstaAtribuido> EstaAtribuidos
        {
          get;
          set;
        }

        public DbSet<ProjetoNew.Models.ProjetoNew.Gt> Gts
        {
          get;
          set;
        }

        public DbSet<ProjetoNew.Models.ProjetoNew.Instituicao> Instituicaos
        {
          get;
          set;
        }

        public DbSet<ProjetoNew.Models.ProjetoNew.Pede> Pedes
        {
          get;
          set;
        }

        public DbSet<ProjetoNew.Models.ProjetoNew.PertenceUi> PertenceUis
        {
          get;
          set;
        }

        public DbSet<ProjetoNew.Models.ProjetoNew.Pertencer> Pertencers
        {
          get;
          set;
        }

        public DbSet<ProjetoNew.Models.ProjetoNew.Pessoa> Pessoas
        {
          get;
          set;
        }

        public DbSet<ProjetoNew.Models.ProjetoNew.Recurso> Recursos
        {
          get;
          set;
        }

        public DbSet<ProjetoNew.Models.ProjetoNew.Servico> Servicos
        {
          get;
          set;
        }

        public DbSet<ProjetoNew.Models.ProjetoNew.Ui> Uis
        {
          get;
          set;
        }
    }
}
