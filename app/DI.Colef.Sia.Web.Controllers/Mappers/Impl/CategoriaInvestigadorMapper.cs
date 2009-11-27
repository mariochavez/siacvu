using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CategoriaInvestigadorMapper : AutoFormMapper<CategoriaInvestigador, CategoriaInvestigadorForm>, ICategoriaInvestigadorMapper
    {
        readonly ICatalogoService catalogoService;

        public CategoriaInvestigadorMapper(IRepository<CategoriaInvestigador> repository,
            ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(CategoriaInvestigadorForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CategoriaInvestigadorForm message, CategoriaInvestigador model)
        {
            model.FechaInicial = message.FechaInicial.FromShortDateToDateTime();
            model.FechaFinal = message.FechaFinal.FromShortDateToDateTime();
            model.Categoria = catalogoService.GetCategoriaById(message.Categoria);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadorEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}