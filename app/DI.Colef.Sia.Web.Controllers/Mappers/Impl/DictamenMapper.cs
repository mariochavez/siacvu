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
			model.TipoDictamen = catalogoService.GetTipoDictamenById(message.TipoDictamen);
            model.FondoConacyt = catalogoService.GetFondoConacytById(message.FondoConacyt);
            model.RevistaPublicacion = catalogoService.GetRevistaPublicacionById(message.RevistaPublicacionId);
            model.Editorial = catalogoService.GetEditorialById(message.Editorial);
        }

        public Dictamen Map(DictamenForm message, Usuario usuario, PeriodoReferencia periodo, Investigador investigador)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadorPor = usuario;
                model.PeriodoReferencia = periodo;
                model.Sede = investigador.CargosInvestigador[investigador.CargosInvestigador.Count - 1].Sede;
                model.Departamento = investigador.CargosInvestigador[investigador.CargosInvestigador.Count - 1].Departamento;
            }

            model.ModificadoPor = usuario;

            return model;
        }
    }
}