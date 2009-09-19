using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class EstatusProyectoMapper : AutoFormMapper<EstatusProyecto, EstatusProyectoForm>, IEstatusProyectoMapper
    {
        public EstatusProyectoMapper(IRepository<EstatusProyecto> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(EstatusProyectoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(EstatusProyectoForm message, EstatusProyecto model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
