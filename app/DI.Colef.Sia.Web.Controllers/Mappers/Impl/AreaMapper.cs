using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class AreaMapper : AutoFormMapper<Area, AreaForm>, IAreaMapper
    {
        public AreaMapper(IRepository<Area> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(AreaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(AreaForm message, Area model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
