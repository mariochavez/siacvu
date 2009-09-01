using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ActividadPrevistaMapper : AutoFormMapper<ActividadPrevista, ActividadPrevistaForm>, IActividadPrevistaMapper
    {
        public ActividadPrevistaMapper(IRepository<ActividadPrevista> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(ActividadPrevistaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ActividadPrevistaForm message, ActividadPrevista model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
