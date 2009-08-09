using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class EstadoProductoMapper : AutoFormMapper<EstadoProducto, EstadoProductoForm>, IEstadoProductoMapper
    {
        public EstadoProductoMapper(IRepository<EstadoProducto> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(EstadoProductoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(EstadoProductoForm message, EstadoProducto model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
