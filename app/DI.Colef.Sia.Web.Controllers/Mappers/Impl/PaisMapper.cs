using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class PaisMapper : AutoFormMapper<Pais, PaisForm>, IPaisMapper
    {
        public PaisMapper(IRepository<Pais> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(PaisForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(PaisForm message, Pais model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
