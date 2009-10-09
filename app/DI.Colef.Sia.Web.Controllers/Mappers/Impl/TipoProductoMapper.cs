using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoProductoMapper : AutoFormMapper<TipoProducto, TipoProductoForm>, ITipoProductoMapper
    {
        public TipoProductoMapper(IRepository<TipoProducto> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TipoProductoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoProductoForm message, TipoProducto model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
