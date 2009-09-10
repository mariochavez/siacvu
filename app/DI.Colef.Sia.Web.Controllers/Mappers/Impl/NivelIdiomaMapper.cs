using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class NivelIdiomaMapper : AutoFormMapper<NivelIdioma, NivelIdiomaForm>, INivelIdiomaMapper
    {
        public NivelIdiomaMapper(IRepository<NivelIdioma> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(NivelIdiomaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(NivelIdiomaForm message, NivelIdioma model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
