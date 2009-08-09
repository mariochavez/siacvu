using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CoautorExternoReporteMapper : AutoFormMapper<CoautorExternoReporte, CoautorExternoReporteForm>, ICoautorExternoReporteMapper
    {
        readonly ICatalogoService catalogoService;

        public CoautorExternoReporteMapper(IRepository<CoautorExternoReporte> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(CoautorExternoReporteForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CoautorExternoReporteForm message, CoautorExternoReporte model)
        {
            model.InvestigadorExterno = catalogoService.GetInvestigadorExternoById(message.InvestigadorExternoId);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadorEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}
