using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class FormaParticipacionMapper : AutoFormMapper<FormaParticipacion, FormaParticipacionForm>, IFormaParticipacionMapper
    {
        public FormaParticipacionMapper(IRepository<FormaParticipacion> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(FormaParticipacionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(FormaParticipacionForm message, FormaParticipacion model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
