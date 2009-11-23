using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoParticipacionMapper : AutoFormMapper<TipoParticipacion, TipoParticipacionForm>, ITipoParticipacionMapper
    {
        public TipoParticipacionMapper(IRepository<TipoParticipacion> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TipoParticipacionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoParticipacionForm message, TipoParticipacion model)
        {
			model.Nombre = message.Nombre;
            model.Tipo = message.Tipo;
        }
    }
}
