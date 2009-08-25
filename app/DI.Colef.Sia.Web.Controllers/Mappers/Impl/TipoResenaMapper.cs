using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoResenaMapper : AutoFormMapper<TipoResena, TipoResenaForm>, ITipoResenaMapper
    {
        public TipoResenaMapper(IRepository<TipoResena> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TipoResenaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoResenaForm message, TipoResena model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
