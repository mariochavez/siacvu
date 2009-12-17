using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class AmbitoMapper : AutoFormMapper<Ambito, AmbitoForm>, IAmbitoMapper
    {
        public AmbitoMapper(IRepository<Ambito> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(AmbitoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(AmbitoForm message, Ambito model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
