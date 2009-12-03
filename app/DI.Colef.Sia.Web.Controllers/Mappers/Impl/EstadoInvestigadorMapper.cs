using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class EstadoInvestigadorMapper : AutoFormMapper<EstadoInvestigador, EstadoInvestigadorForm>, IEstadoInvestigadorMapper
    {
        readonly ICatalogoService catalogoService;

        public EstadoInvestigadorMapper(IRepository<EstadoInvestigador> repository,
            ICatalogoService catalogoService) : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(EstadoInvestigadorForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(EstadoInvestigadorForm message, EstadoInvestigador model)
        {
            model.FechaInicial = message.FechaInicial.FromShortDateToDateTime();
            model.FechaFinal = message.FechaFinal.FromShortDateToDateTime();
            model.Estado = catalogoService.GetEstadoById(message.Estado);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadoEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}
