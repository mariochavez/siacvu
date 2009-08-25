using System;
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
        readonly ITipoParticipacionEventoMapper tipoParticipacionEventoMapper;
        readonly ICoautorExternoEventoMapper coautorExternoEventoMapper;
        readonly ICoautorInternoEventoMapper coautorInternoEventoMapper;

        public EventoMapper(IRepository<Evento> repository, ICatalogoService catalogoService,
            ITipoParticipacionEventoMapper tipoParticipacionEventoMapper, ICoautorExternoEventoMapper coautorExternoEventoMapper,
            ICoautorInternoEventoMapper coautorInternoEventoMapper
        )
            : base(repository)
        {
            this.catalogoService = catalogoService;
            this.tipoParticipacionEventoMapper = tipoParticipacionEventoMapper;
            this.coautorExternoEventoMapper = coautorExternoEventoMapper;
            this.coautorInternoEventoMapper = coautorInternoEventoMapper;
        }

        protected override int GetIdFromMessage(EventoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(EventoForm message, Evento model)
        {
            model.Nombre = message.Nombre;
            model.Titulo = message.Titulo;
            model.Invitacion = message.Invitacion;
            model.Lugar = message.Lugar;
            model.PalabraClave1 = message.PalabraClave1;
            model.PalabraClave2 = message.PalabraClave2;
            model.PalabraClave3 = message.PalabraClave3;

            model.FechaInicial = message.FechaInicial.FromShortDateToDateTime();
            model.FechaFinal = message.FechaFinal.FromShortDateToDateTime();

            model.Ambito = catalogoService.GetAmbitoById(message.Ambito);
            model.TipoEvento = catalogoService.GetTipoEventoById(message.TipoEvento);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematicaId);
            model.TipoFinanciamiento = catalogoService.GetTipoFinanciamientoById(message.TipoFinanciamiento);
        }

        public Evento Map(EventoForm message, Usuario usuario, Investigador investigador, PeriodoReferencia periodo)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Investigador = investigador;
                model.CreadorPor = usuario;
                model.PeriodoReferencia = periodo;
            }

            model.ModificadoPor = usuario;

            return model;
        }

        public Evento Map(EventoForm message, Usuario usuario, Investigador investigador, PeriodoReferencia periodo,
            string[] coautoresExternos, string[] coautoresInternos, string[] tipoParticipaciones)
        {
            var model = Map(message, usuario, investigador, periodo);

            foreach (var coautorId in coautoresExternos)
            {
                var coautor =
                    coautorExternoEventoMapper.Map(new CoautorExternoEventoForm
                                                       {InvestigadorExternoId = int.Parse(coautorId)});

                coautor.CreadorPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorExterno(coautor);
            }

            foreach (var coautorId in coautoresInternos)
            {
                var coautor =
                    coautorInternoEventoMapper.Map(new CoautorInternoEventoForm {InvestigadorId = int.Parse(coautorId)});

                coautor.CreadorPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorInterno(coautor);
            }

            foreach (var psrticipacionId in tipoParticipaciones)
            {
                var participacion =
                    tipoParticipacionEventoMapper.Map(new TipoParticipacionEventoForm
                                                          {TipoParticipacionId = int.Parse(psrticipacionId)});

                participacion.CreadorPor = usuario;
                participacion.ModificadoPor = usuario;

                model.AddTipo(participacion);
            }

            return model;
        }
    }
}
