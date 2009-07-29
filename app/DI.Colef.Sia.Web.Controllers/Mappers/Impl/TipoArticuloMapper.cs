using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoArticuloMapper : AutoFormMapper<TipoArticulo, TipoArticuloForm>, ITipoArticuloMapper
    {
        public TipoArticuloMapper(IRepository<TipoArticulo> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TipoArticuloForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoArticuloForm message, TipoArticulo model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
