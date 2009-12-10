using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ResponsableProyectoMapper : AutoFormMapper<ResponsableProyecto, ResponsableProyectoForm>, IResponsableProyectoMapper
    {
        readonly IInvestigadorService investigadorService;

        public ResponsableProyectoMapper(IRepository<ResponsableProyecto> repository, IInvestigadorService investigadorService)
            : base(repository)
        {
            this.investigadorService = investigadorService;
        }

        protected override int GetIdFromMessage(ResponsableProyectoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ResponsableProyectoForm message, ResponsableProyecto model)
        {
            model.Investigador = investigadorService.GetInvestigadorById(message.InvestigadorId);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadoEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}
