using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class SesionEventoMapper : AutoFormMapper<SesionEvento, SesionEventoForm>, ISesionEventoMapper
    {
        readonly ICatalogoService catalogoService;
        readonly IParticipanteExternoEventoMapper participanteExternoEventoMapper;
        readonly IParticipanteInternoEventoMapper participanteInternoEventoMapper;

        public SesionEventoMapper(IRepository<SesionEvento> repository,
            IParticipanteExternoEventoMapper participanteExternoEventoMapper,
            IParticipanteInternoEventoMapper participanteInternoEventoMapper,
            ICatalogoService catalogoService
            ) : base(repository)
        {
            this.participanteExternoEventoMapper = participanteExternoEventoMapper;
            this.participanteInternoEventoMapper = participanteInternoEventoMapper;
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(SesionEventoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(SesionEventoForm message, SesionEvento model)
        {
            model.Lugar = message.Lugar;
            model.NombreSesion = message.NombreSesion;
            model.ObjetivoSesion = message.ObjetivoSesion;
            model.FechaEvento = message.FechaEvento.FromShortDateToDateTime();
            model.Ambito = catalogoService.GetAmbitoById(message.Ambito);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadoEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }

        public SesionEvento Map(SesionEventoForm message, Usuario usuario, Investigador investigador)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.CreadoPor = usuario;
            }

            model.ModificadoPor = usuario;

            return model;
        }

        public SesionEvento Map(SesionEventoForm message, Usuario usuario, Investigador investigador,
            ParticipanteExternoProductoForm[] participantesExternos, ParticipanteInternoProductoForm[] participantesInternos)
        {
            var model = Map(message, usuario, investigador);

            foreach (var participanteExterno in participantesExternos)
            {
                var participante =
                    participanteExternoEventoMapper.Map(participanteExterno);

                participante.CreadoPor = usuario;
                participante.ModificadoPor = usuario;

                model.AddParticipanteExterno(participante);
            }

            foreach (var participanteInterno in participantesInternos)
            {
                var participante =
                    participanteInternoEventoMapper.Map(participanteInterno);

                participante.CreadoPor = usuario;
                participante.ModificadoPor = usuario;

                model.AddParticipanteInterno(participante);
            }

            return model;
        }
    }
}