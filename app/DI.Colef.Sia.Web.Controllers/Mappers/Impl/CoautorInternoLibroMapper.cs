using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CoautorInternoLibroMapper : AutoFormMapper<CoautorInternoLibro, CoautorInternoLibroForm>, ICoautorInternoLibroMapper
    {
        readonly IInvestigadorService investigadorService;
		
		public CoautorInternoLibroMapper(IRepository<CoautorInternoLibro> repository,
            IInvestigadorService investigadorService)
			: base(repository)
        {
            this.investigadorService = investigadorService;
        }
		
        protected override int GetIdFromMessage(CoautorInternoLibroForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CoautorInternoLibroForm message, CoautorInternoLibro model)
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
