using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoPresentacionMapper : AutoFormMapper<TipoPresentacion, TipoPresentacionForm>, ITipoPresentacionMapper
    {
        public TipoPresentacionMapper(IRepository<TipoPresentacion> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TipoPresentacionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoPresentacionForm message, TipoPresentacion model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
