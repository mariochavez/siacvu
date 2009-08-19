using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoParticipacionEventoMapper : AutoFormMapper<TipoParticipacionEvento, TipoParticipacionEventoForm>, ITipoParticipacionEventoMapper
    {
        readonly ICatalogoService catalogoService;

        public TipoParticipacionEventoMapper(IRepository<TipoParticipacionEvento> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(TipoParticipacionEventoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoParticipacionEventoForm message, TipoParticipacionEvento model)
        {
            model.TipoParticipacion = catalogoService.GetTipoParticipacionById(message.TipoParticipacionId);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadorEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}
