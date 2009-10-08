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
        readonly IInvestigadorService investigadorService;
        readonly IProyectoService proyectoService;

		public ParticipacionMapper(IRepository<Participacion> repository,
		    ICatalogoService catalogoService,
            IInvestigadorService investigadorService,
            IProyectoService proyectoService
		) : base(repository)
        {
			this.catalogoService = catalogoService;
            this.investigadorService = investigadorService;
		    this.proyectoService = proyectoService;
        }
		
        protected override int GetIdFromMessage(ParticipacionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ParticipacionForm message, Participacion model)
        {
            model.Titulo = message.Titulo;
            model.Lugar = message.Lugar;
            model.Ciudad = message.Ciudad;

            model.FechaPresentacion = message.FechaPresentacion.FromShortDateToDateTime();

			model.OtraParticipacion = catalogoService.GetOtraParticipacionById(message.OtraParticipacion);
		    model.TipoPresentacion = catalogoService.GetTipoPresentacionById(message.TipoPresentacion);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
		    model.Proyecto = proyectoService.GetProyectoById(message.Proyecto);
		    model.Pais = catalogoService.GetPaisById(message.Pais);
		    model.EstadoPais = catalogoService.GetEstadoPaisById(message.EstadoPais);
            model.Autor = investigadorService.GetInvestigadorById(message.Autor);
        }

        public Participacion Map(ParticipacionForm message, Usuario usuario, PeriodoReferencia periodo, Investigador investigador)
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
