using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ProductoDerivadoMapper : AutoFormMapper<ProductoDerivado, ProductoDerivadoForm>, IProductoDerivadoMapper
    {
        public ProductoDerivadoMapper(IRepository<ProductoDerivado> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(ProductoDerivadoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ProductoDerivadoForm message, ProductoDerivado model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
