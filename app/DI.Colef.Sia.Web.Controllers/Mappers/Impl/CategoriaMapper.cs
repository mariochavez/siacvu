using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CategoriaMapper : AutoFormMapper<Categoria, CategoriaForm>, ICategoriaMapper
    {
        public CategoriaMapper(IRepository<Categoria> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(CategoriaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CategoriaForm message, Categoria model)
        {
            model.Activo = message.Activo;
			model.Nombre = message.Nombre;
        }
    }
}
