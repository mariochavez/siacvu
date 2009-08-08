using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ParticipacionMapper : AutoFormMapper<Participacion, ParticipacionForm>, IParticipacionMapper
    {
		readonly ICatalogoService catalogoService;

		public ParticipacionMapper(IRepository<Participacion> repository
		, ICatalogoService catalogoService

		) 
			: base(repository)
        {
			this.catalogoService = catalogoService;

        }		
		
        protected override int GetIdFromMessage(ParticipacionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ParticipacionForm message, Participacion model)
        {
			model.OtraParticipacion = catalogoService.GetOtraParticipacionById(message.OtraParticipacion);
		model.TipoPresentacion = catalogoService.GetTipoPresentacionById(message.TipoPresentacion);
		model.FechaPresentacion = message.FechaPresentacion.FromShortDateToDateTime();
		model.PeriodoReferencia = catalogoService.GetPeriodoReferenciaById(message.PeriodoReferencia);
		model.Proyecto = catalogoService.GetProyectoById(message.Proyecto);
		model.Pais = catalogoService.GetPaisById(message.Pais);
		model.EstadoPais = catalogoService.GetEstadoPaisById(message.EstadoPais);
        }
    }
}
