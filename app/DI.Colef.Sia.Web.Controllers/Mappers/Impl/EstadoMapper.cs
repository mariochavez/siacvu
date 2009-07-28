using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class EstadoMapper : AutoFormMapper<Estado, EstadoForm>, IEstadoMapper
    {
        public EstadoMapper(IRepository<Estado> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(EstadoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(EstadoForm message, Estado model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
