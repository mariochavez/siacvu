using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CoautorExternoCapituloMapper : AutoFormMapper<CoautorExternoCapitulo, CoautorExternoCapituloForm>, ICoautorExternoCapituloMapper
    {
		readonly ICatalogoService catalogoService;
		
		public CoautorExternoCapituloMapper(IRepository<CoautorExternoCapitulo> repository,	ICatalogoService catalogoService) 
			: base(repository)
        {
			this.catalogoService = catalogoService;
        }
		
        protected override int GetIdFromMessage(CoautorExternoCapituloForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CoautorExternoCapituloForm message, CoautorExternoCapitulo model)
        {
			model.InvestigadorExterno = catalogoService.GetInvestigadorExternoById(message.InvestigadorExterno);
			
			if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadorEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}
