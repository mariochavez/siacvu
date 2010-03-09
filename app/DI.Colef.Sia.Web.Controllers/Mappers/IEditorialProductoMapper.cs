using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface IEditorialProductoMapper<TModel> : IMapper<EditorialProducto, EditorialProductoForm> where TModel:Entity, new()
    {
    }
}
