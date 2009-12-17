using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoEventoMapper : AutoFormMapper<TipoEvento, TipoEventoForm>, ITipoEventoMapper
    {
        public TipoEventoMapper(IRepository<TipoEvento> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TipoEventoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoEventoForm message, TipoEvento model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
