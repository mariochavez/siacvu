using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ResponsableInternoCapituloMapper : AutoFormMapper<ResponsableInternoCapitulo, ResponsableInternoCapituloForm>, IResponsableInternoCapituloMapper
    {
        readonly IInvestigadorService investigadorService;
		
		public ResponsableInternoCapituloMapper(IRepository<ResponsableInternoCapitulo> repository,
            IInvestigadorService investigadorService)
			: base(repository)
        {
            this.investigadorService = investigadorService;
        }
		
        protected override int GetIdFromMessage(ResponsableInternoCapituloForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ResponsableInternoCapituloForm message, ResponsableInternoCapitulo model)
        {
            model.Investigador = investigadorService.GetInvestigadorById(message.Investigador);
			
			if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadorEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}
