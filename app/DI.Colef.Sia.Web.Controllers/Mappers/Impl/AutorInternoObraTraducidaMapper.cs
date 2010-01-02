using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class AutorInternoObraTraducidaMapper : AutoFormMapper<AutorInternoObraTraducida, AutorInternoProductoForm>, IAutorInternoObraTraducidaMapper
    {
        readonly IInvestigadorService investigadorService;
		
		public AutorInternoObraTraducidaMapper(IRepository<AutorInternoObraTraducida> repository,
            IInvestigadorService investigadorService)
			: base(repository)
        {
            this.investigadorService = investigadorService;
        }

        protected override int GetIdFromMessage(AutorInternoProductoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(AutorInternoProductoForm message, AutorInternoObraTraducida model)
        {
            model.Investigador = investigadorService.GetInvestigadorById(message.InvestigadorId);
			
			if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadoEl = DateTime.Now;
            }

            model.ModificadoEl = DateTime.Now;
            model.Posicion = message.Posicion;
            model.AutorSeOrdenaAlfabeticamente = message.AutorSeOrdenaAlfabeticamente;
        }
    }
}