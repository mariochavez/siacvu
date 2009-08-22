using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class DictamenMapper : AutoFormMapper<Dictamen, DictamenForm>, IDictamenMapper
    {
		readonly ICatalogoService catalogoService;

		public DictamenMapper(IRepository<Dictamen> repository
		, ICatalogoService catalogoService
		) 
			: base(repository)
        {
			this.catalogoService = catalogoService;
        }		
		
        protected override int GetIdFromMessage(DictamenForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(DictamenForm message, Dictamen model)
        {
            model.Nombre = message.Nombre;

			model.TipoDictamen = catalogoService.GetTipoDictamenById(message.TipoDictamen);
		    model.TipoParticipacion = catalogoService.GetTipoParticipacionById(message.TipoParticipacion);
		    model.Institucion = catalogoService.GetInstitucionById(message.Institucion);
            model.PeriodoReferencia = catalogoService.GetPeriodoReferenciaById(message.PeriodoReferenciaId);
        }

        public Dictamen Map(DictamenForm message, Usuario usuario, Investigador investigador)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Investigador = investigador;
                model.CreadorPor = usuario;
            }

            model.ModificadoPor = usuario;

            return model;
        }
    }
}
