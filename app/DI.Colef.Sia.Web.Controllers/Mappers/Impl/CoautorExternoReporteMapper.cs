using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CoautorExternoReporteMapper : AutoFormMapper<CoautorExternoReporte, CoautorExternoProductoForm>, ICoautorExternoReporteMapper
    {
        readonly ICatalogoService catalogoService;

        public CoautorExternoReporteMapper(IRepository<CoautorExternoReporte> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(CoautorExternoProductoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CoautorExternoProductoForm message, CoautorExternoReporte model)
        {
            model.InvestigadorExterno = catalogoService.GetInvestigadorExternoById(message.InvestigadorExternoId);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadorEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
            model.Posicion = message.Posicion;
        }
    }
}
