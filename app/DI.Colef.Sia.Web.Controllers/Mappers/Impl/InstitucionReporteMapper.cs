using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class InstitucionReporteMapper: AutoFormMapper<InstitucionReporte, InstitucionProductoForm>, IInstitucionReporteMapper
    {
		readonly ICatalogoService catalogoService;

        public InstitucionReporteMapper(IRepository<InstitucionReporte> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(InstitucionProductoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(InstitucionProductoForm message, InstitucionReporte model)
        {
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
			
			if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadoEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}