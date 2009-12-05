using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class AutorExternoObraTraducidaMapper : AutoFormMapper<AutorExternoObraTraducida, AutorExternoProductoForm>, IAutorExternoObraTraducidaMapper
    {
		readonly ICatalogoService catalogoService;
		
		public AutorExternoObraTraducidaMapper(IRepository<AutorExternoObraTraducida> repository, ICatalogoService catalogoService) 
			: base(repository)
        {
			this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(AutorExternoProductoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(AutorExternoProductoForm message, AutorExternoObraTraducida model)
        {
            model.InvestigadorExterno = catalogoService.GetInvestigadorExternoById(message.InvestigadorExternoId);
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
