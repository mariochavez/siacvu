using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class AutorInternoCapituloMapper : AutoFormMapper<AutorInternoCapitulo, AutorInternoProductoForm>, IAutorInternoCapituloMapper
    {
        readonly IInvestigadorService investigadorService;
		
		public AutorInternoCapituloMapper(IRepository<AutorInternoCapitulo> repository,
            IInvestigadorService investigadorService)
			: base(repository)
        {
            this.investigadorService = investigadorService;
        }

        protected override int GetIdFromMessage(AutorInternoProductoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(AutorInternoProductoForm message, AutorInternoCapitulo model)
        {
            model.Investigador = investigadorService.GetInvestigadorById(message.InvestigadorId);
			
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
