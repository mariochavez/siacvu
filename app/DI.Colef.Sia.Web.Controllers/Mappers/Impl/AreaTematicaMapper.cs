using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class AreaTematicaMapper : AutoFormMapper<AreaTematica, CatalogoForm>, IAreaTematicaMapper
    {
        public AreaTematicaMapper(IRepository<AreaTematica> repository)
            : base(repository)
        {
        }

        protected override int GetIdFromMessage(CatalogoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CatalogoForm message, AreaTematica model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
