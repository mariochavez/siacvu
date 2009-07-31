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
            model.Fecha = message.Fecha.FromShortDateToDateTime();
            model.Estado = catalogoService.GetEstadoById(message.Estado);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadorEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}
