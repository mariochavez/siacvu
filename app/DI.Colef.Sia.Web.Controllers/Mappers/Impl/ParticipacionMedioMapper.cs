using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ParticipacionMedioMapper : AutoFormMapper<ParticipacionMedio, ParticipacionMedioForm>, IParticipacionMedioMapper
    {
		readonly ICatalogoService catalogoService;

		public ParticipacionMedioMapper(IRepository<ParticipacionMedio> repository
		, ICatalogoService catalogoService
		) 
			: base(repository)
        {
			this.catalogoService = catalogoService;

        }		
		
        protected override int GetIdFromMessage(ParticipacionMedioForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ParticipacionMedioForm message, ParticipacionMedio model)
        {
			model.MedioImpreso = catalogoService.GetMedioImpresoById(message.MedioImpreso);
		model.MedioElectronico = catalogoService.GetMedioElectronicoById(message.MedioElectronico);
		model.Genero = catalogoService.GetGeneroById(message.Genero);
		model.PeriodoReferencia = catalogoService.GetPeriodoReferenciaById(message.PeriodoReferencia);
		model.Proyecto = catalogoService.GetProyectoById(message.Proyecto);
		model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematica);
		model.Ambito = catalogoService.GetAmbitoById(message.Ambito);
		model.FechaDifusion = message.FechaDifusion.FromShortDateToDateTime();
		model.Pais = catalogoService.GetPaisById(message.Pais);
		model.EstadoPais = catalogoService.GetEstadoPaisById(message.EstadoPais);
        }
    }
}
