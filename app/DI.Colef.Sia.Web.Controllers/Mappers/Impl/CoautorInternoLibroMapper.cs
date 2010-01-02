using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CoautorInternoLibroMapper : AutoFormMapper<CoautorInternoLibro, CoautorInternoProductoForm>, ICoautorInternoLibroMapper
    {
        readonly IInvestigadorService investigadorService;
		
		public CoautorInternoLibroMapper(IRepository<CoautorInternoLibro> repository,
            IInvestigadorService investigadorService)
			: base(repository)
        {
            this.investigadorService = investigadorService;
        }

        protected override int GetIdFromMessage(CoautorInternoProductoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CoautorInternoProductoForm message, CoautorInternoLibro model)
        {
            model.Investigador = investigadorService.GetInvestigadorById(message.InvestigadorId);
			
			if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadoEl = DateTime.Now;
            }

            model.ModificadoEl = DateTime.Now;
            model.Posicion = message.Posicion;
            model.CoautorSeOrdenaAlfabeticamente = message.CoautorSeOrdenaAlfabeticamente;
        }
    }
}
