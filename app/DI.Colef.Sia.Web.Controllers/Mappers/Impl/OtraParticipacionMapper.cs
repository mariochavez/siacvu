using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class OtraParticipacionMapper : AutoFormMapper<OtraParticipacion, OtraParticipacionForm>, IOtraParticipacionMapper
    {
        public OtraParticipacionMapper(IRepository<OtraParticipacion> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(OtraParticipacionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(OtraParticipacionForm message, OtraParticipacion model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
