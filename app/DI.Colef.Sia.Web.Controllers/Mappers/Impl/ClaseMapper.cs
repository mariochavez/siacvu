using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ClaseMapper : AutoFormMapper<Clase, ClaseForm>, IClaseMapper
    {
        public ClaseMapper(IRepository<Clase> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(ClaseForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ClaseForm message, Clase model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
