using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoProyectoMapper : AutoFormMapper<TipoProyecto, TipoProyectoForm>, ITipoProyectoMapper
    {
        public TipoProyectoMapper(IRepository<TipoProyecto> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TipoProyectoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoProyectoForm message, TipoProyecto model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
