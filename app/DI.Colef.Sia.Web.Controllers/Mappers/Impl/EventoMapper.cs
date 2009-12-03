using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class EventoMapper : AutoFormMapper<Evento, EventoForm>, IEventoMapper
    {
        readonly ICatalogoService catalogoService;
        readonly ICoautorExternoEventoMapper coautorExternoEventoMapper;
        readonly ICoautorInternoEventoMapper coautorInternoEventoMapper;
        readonly IInstitucionEventoMapper institucionEventoMapper;

        public EventoMapper(IRepository<Evento> repository, ICatalogoService catalogoService,
            ICoautorExternoEventoMapper coautorExternoEventoMapper,
            ICoautorInternoEventoMapper coautorInternoEventoMapper, IInstitucionEventoMapper institucionEventoMapper
        )
            : base(repository)
        {
            this.catalogoService = catalogoService;
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
            model.Lugar = message.Lugar;
            model.PalabraClave1 = message.PalabraClave1;
            model.PalabraClave2 = message.PalabraClave2;
            model.PalabraClave3 = message.PalabraClave3;
            model.ObjetivoEvento = message.ObjetivoEvento;
            model.PosicionAutor = message.PosicionAutor;

            model.FechaEvento = message.FechaEvento.FromShortDateToDateTime();

            model.Ambito = catalogoService.GetAmbitoById(message.Ambito);
            model.TipoParticipacion = catalogoService.GetTipoParticipacionById(message.TipoParticipacion);
            model.TipoEvento = catalogoService.GetTipoEventoById(message.TipoEvento);
            model.Pais = catalogoService.GetPaisById(message.Pais);
        }

        public Evento Map(EventoForm message, Usuario usuario, Investigador investigador)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadoPor = usuario;
                model.Sede = GetLatest(investigador.CargosInvestigador).Sede;
                model.Departamento = GetLatest(investigador.CargosInvestigador).Departamento;
            }

            model.ModificadoPor = usuario;

            return model;
        }

        public Evento Map(EventoForm message, Usuario usuario, Investigador investigador,
            CoautorExternoProductoForm[] coautoresExternos, CoautorInternoProductoForm[] coautoresInternos, 
            InstitucionEventoForm[] instituciones)
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

            return model;
        }
    }
}
