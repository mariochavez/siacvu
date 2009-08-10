using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class NivelEstudioMapper : AutoFormMapper<NivelEstudio, NivelEstudioForm>, INivelEstudioMapper
    {
        public NivelEstudioMapper(IRepository<NivelEstudio> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(NivelEstudioForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(NivelEstudioForm message, NivelEstudio model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
