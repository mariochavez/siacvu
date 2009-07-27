using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class PuestoMapper : AutoFormMapper<Puesto, PuestoForm>, IPuestoMapper
    {
        public PuestoMapper(IRepository<Puesto> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(PuestoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(PuestoForm message, Puesto model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
