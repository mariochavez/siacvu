using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class NivelMapper : AutoFormMapper<Nivel, NivelForm>, INivelMapper
    {
        public NivelMapper(IRepository<Nivel> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(NivelForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(NivelForm message, Nivel model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
