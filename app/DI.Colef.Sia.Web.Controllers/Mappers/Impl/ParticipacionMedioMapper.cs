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
        readonly IProyectoService proyectoService;

		public ParticipacionMedioMapper(IRepository<ParticipacionMedio> repository
		, ICatalogoService catalogoService, IProyectoService proyectoService
		) 
			: base(repository)
        {
			this.catalogoService = catalogoService;
		    this.proyectoService = proyectoService;
        }		
		
        protected override int GetIdFromMessage(ParticipacionMedioForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ParticipacionMedioForm message, ParticipacionMedio model)
        {
            model.Titulo = message.Titulo;
            model.Nombre = message.Nombre;
            model.Ciudad = message.Ciudad;
            model.EspecificacionMedioElectronico = message.EspecificacionMedioElectronico;
            model.EspecificacionMedioImpreso = message.EspecificacionMedioImpreso;
            model.Tema = message.Tema;
            model.NotaPeriodistica = message.NotaPeriodistica;
            model.PalabraClave1 = message.PalabraClave1;
            model.PalabraClave2 = message.PalabraClave2;
            model.PalabraClave3 = message.PalabraClave3;

            model.FechaDifusion = message.FechaDifusion.FromShortDateToDateTime();

			model.MedioImpreso = catalogoService.GetMedioImpresoById(message.MedioImpreso);
            model.DirigidoA = catalogoService.GetDirigidoAById(message.DirigidoA);
		    model.MedioElectronico = catalogoService.GetMedioElectronicoById(message.MedioElectronico);
		    model.Genero = catalogoService.GetGeneroById(message.Genero);
		    model.Proyecto = proyectoService.GetProyectoById(message.Proyecto);
		    model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematicaId);
		    model.Ambito = catalogoService.GetAmbitoById(message.Ambito);
		    model.Pais = catalogoService.GetPaisById(message.Pais);
		    model.EstadoPais = catalogoService.GetEstadoPaisById(message.EstadoPais);
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
