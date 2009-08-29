using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class RamaMapper : AutoFormMapper<Rama, RamaForm>, IRamaMapper
    {
        public RamaMapper(IRepository<Rama> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(RamaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(RamaForm message, Rama model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
