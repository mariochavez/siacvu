using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CoordinacionMapper : AutoFormMapper<Coordinacion, CoordinacionForm>, ICoordinacionMapper
    {
        public CoordinacionMapper(IRepository<Coordinacion> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(CoordinacionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CoordinacionForm message, Coordinacion model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
