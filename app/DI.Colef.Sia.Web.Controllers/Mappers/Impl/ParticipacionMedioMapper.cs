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

		public ParticipacionMedioMapper(IRepository<ParticipacionMedio> repository,
		    ICatalogoService catalogoService) 
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
            model.Titulo = message.Titulo;
            model.Institucion = message.Institucion;
            model.LugarPresentacion = message.LugarPresentacion;
            model.PalabraClave1 = message.PalabraClave1;
            model.PalabraClave2 = message.PalabraClave2;
            model.PalabraClave3 = message.PalabraClave3;

            model.FechaPresentacion = message.FechaPresentacion.FromShortDateToDateTime();

            model.TipoParticipacion = catalogoService.GetTipoParticipacionById(message.TipoParticipacion);
            model.DirigidoA = catalogoService.GetDirigidoAById(message.DirigidoA);
            model.AreaTematica = catalogoService.GetAreaTematicaById(message.AreaTematicaId);
		    model.Ambito = catalogoService.GetAmbitoById(message.Ambito);
        }

        public ParticipacionMedio Map(ParticipacionMedioForm message, Usuario usuario, Investigador investigador)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadorPor = usuario;
                model.Sede = GetLatest(investigador.CargosInvestigador).Sede;
                model.Departamento = GetLatest(investigador.CargosInvestigador).Departamento;
            }

            model.ModificadoPor = usuario;

            return model;
        }
    }
}