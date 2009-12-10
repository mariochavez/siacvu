using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ParticipanteInternoEventoMapper : AutoFormMapper<ParticipanteInternoEvento, ParticipanteInternoProductoForm>, IParticipanteInternoEventoMapper
    {
        readonly IInvestigadorService investigadorService;

        public ParticipanteInternoEventoMapper(IRepository<ParticipanteInternoEvento> repository, IInvestigadorService investigadorService)
            : base(repository)
        {
            this.investigadorService = investigadorService;
        }

        protected override int GetIdFromMessage(ParticipanteInternoProductoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ParticipanteInternoProductoForm message, ParticipanteInternoEvento model)
        {
            model.Investigador = investigadorService.GetInvestigadorById(message.InvestigadorId);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadoEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
            model.Posicion = message.Posicion;
        }
    }
}
