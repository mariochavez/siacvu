using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class EventoMapper : AutoFormMapper<Evento, EventoForm>, IEventoMapper
    {
        readonly ICatalogoService catalogoService;
        readonly ISesionEventoMapper sesionEventoMapper;
        readonly ICoautorExternoEventoMapper coautorExternoEventoMapper;
        readonly ICoautorInternoEventoMapper coautorInternoEventoMapper;
        readonly IInstitucionEventoMapper institucionEventoMapper;
        private Usuario usuarioEvento = null;

        public EventoMapper(IRepository<Evento> repository, ICatalogoService catalogoService,
            ICoautorExternoEventoMapper coautorExternoEventoMapper,
            ISesionEventoMapper sesionEventoMapper,
            ICoautorInternoEventoMapper coautorInternoEventoMapper,
            IInstitucionEventoMapper institucionEventoMapper
        )
            : base(repository)
        {
            this.catalogoService = catalogoService;
            this.sesionEventoMapper = sesionEventoMapper;
            this.coautorExternoEventoMapper = coautorExternoEventoMapper;
            this.coautorInternoEventoMapper = coautorInternoEventoMapper;
            this.institucionEventoMapper = institucionEventoMapper;
        }

        protected override int GetIdFromMessage(EventoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(EventoForm message, Evento model)
        {
            model.Nombre = message.Nombre;
            model.TituloTrabajo = message.TituloTrabajo;
            model.Invitacion = message.Invitacion;
            model.PalabraClave1 = message.PalabraClave1;
            model.PalabraClave2 = message.PalabraClave2;
            model.PalabraClave3 = message.PalabraClave3;
            model.ObjetivoEvento = message.ObjetivoEvento;
            model.FinanciamientoInterno = message.FinanciamientoInterno;
            model.FinanciamientoExterno = message.FinanciamientoExterno;
            model.SesionesTrabajo = message.SesionesTrabajo;

            if (model.Usuario == null || model.Usuario == usuarioEvento)
                model.PosicionAutor = message.PosicionAutor;

            model.TipoParticipacion = catalogoService.GetTipoParticipacionById(message.TipoParticipacion);
            model.AreaTematica = catalogoService.GetAreaTematicaById(message.AreaTematicaId);
            model.TipoEvento = catalogoService.GetTipoEventoById(message.TipoEvento);
        }

        public Evento Map(EventoForm message, Usuario usuario)
        {
            var model = Map(message);

            model.ModificadoPor = usuario;

            return model;
        }

        public Evento Map(EventoForm message, Usuario usuario, Investigador investigador)
        {
            usuarioEvento = usuario;
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadoPor = usuario;
                model.Sede = GetLatest(investigador.CargosInvestigador).Sede;
                model.Departamento = GetLatest(investigador.CargosInvestigador).Departamento;
            }

            if (model.Usuario != investigador.Usuario)
            {
                foreach (var coautor in model.CoautorInternoEventos)
                {
                    if (coautor.Investigador == investigador)
                        coautor.Posicion = message.PosicionAutor;
                }
            }

            model.ModificadoPor = usuario;

            return model;
        }

        public Evento Map(EventoForm message, Usuario usuario, Investigador investigador,
            CoautorExternoProductoForm[] coautoresExternos, CoautorInternoProductoForm[] coautoresInternos, 
            InstitucionProductoForm[] instituciones, SesionEventoForm[] sesiones)
        {
            var model = Map(message, usuario, investigador);

            foreach (var coautorExterno in coautoresExternos)
            {
                var coautor =
                    coautorExternoEventoMapper.Map(coautorExterno);

                coautor.CreadoPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorExterno(coautor);
            }

            foreach (var coautorInterno in coautoresInternos)
            {
                var coautor =
                    coautorInternoEventoMapper.Map(coautorInterno);

                coautor.CreadoPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorInterno(coautor);
            }

            foreach (var institucion in instituciones)
            {
                var institucionEvento =
                    institucionEventoMapper.Map(institucion);

                institucionEvento.CreadoPor = usuario;
                institucionEvento.ModificadoPor = usuario;

                model.AddInstitucion(institucionEvento);
            }

            foreach (var sesion in sesiones)
            {
                var sesionEvento =
                    sesionEventoMapper.Map(sesion);

                sesionEvento.CreadoPor = usuario;
                sesionEvento.ModificadoPor = usuario;

                model.AddSesion(sesionEvento);
            }

            return model;
        }
    }
}
