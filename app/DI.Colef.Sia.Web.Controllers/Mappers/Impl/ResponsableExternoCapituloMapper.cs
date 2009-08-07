using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ResponsableExternoCapituloMapper : AutoFormMapper<ResponsableExternoCapitulo, ResponsableExternoCapituloForm>, IResponsableExternoCapituloMapper
    {
		readonly ICatalogoService catalogoService;
		
		public ResponsableExternoCapituloMapper(IRepository<ResponsableExternoCapitulo> repository,	ICatalogoService catalogoService) 
			: base(repository)
        {
			this.catalogoService = catalogoService;
        }
		
        protected override int GetIdFromMessage(ResponsableExternoCapituloForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ResponsableExternoCapituloForm message, ResponsableExternoCapitulo model)
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
