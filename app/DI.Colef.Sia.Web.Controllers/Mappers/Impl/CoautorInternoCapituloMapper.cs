using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CoautorInternoCapituloMapper : AutoFormMapper<CoautorInternoCapitulo, CoautorInternoCapituloForm>, ICoautorInternoCapituloMapper
    {
        readonly IInvestigadorService investigadorService;
		
		public CoautorInternoCapituloMapper(IRepository<CoautorInternoCapitulo> repository,
            IInvestigadorService investigadorService)
			: base(repository)
        {
            this.investigadorService = investigadorService;
        }
		
        protected override int GetIdFromMessage(CoautorInternoCapituloForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CoautorInternoCapituloForm message, CoautorInternoCapitulo model)
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
