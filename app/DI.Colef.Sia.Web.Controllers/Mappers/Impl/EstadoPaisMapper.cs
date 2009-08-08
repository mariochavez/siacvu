using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class EstadoPaisMapper : AutoFormMapper<EstadoPais, EstadoPaisForm>, IEstadoPaisMapper
    {
        public EstadoPaisMapper(IRepository<EstadoPais> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(EstadoPaisForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(EstadoPaisForm message, EstadoPais model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
