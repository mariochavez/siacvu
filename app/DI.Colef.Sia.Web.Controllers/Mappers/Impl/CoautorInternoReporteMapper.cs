using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CoautorInternoReporteMapper : AutoFormMapper<CoautorInternoReporte, CoautorInternoReporteForm>, ICoautorInternoReporteMapper
    {
        readonly IInvestigadorService investigadorService;

        public CoautorInternoReporteMapper(IRepository<CoautorInternoReporte> repository, IInvestigadorService investigadorService)
            : base(repository)
        {
            this.investigadorService = investigadorService;
        }

        protected override int GetIdFromMessage(CoautorInternoReporteForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CoautorInternoReporteForm message, CoautorInternoReporte model)
        {
            model.Investigador = investigadorService.GetInvestigadorById(message.InvestigadorId);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadorEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}
