using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ProductoAcademicoMapper : AutoFormMapper<ProductoAcademico, ProductoAcademicoForm>, IProductoAcademicoMapper
    {
        public ProductoAcademicoMapper(IRepository<ProductoAcademico> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(ProductoAcademicoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ProductoAcademicoForm message, ProductoAcademico model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
