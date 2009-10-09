using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class FormatoPublicacionMapper : AutoFormMapper<FormatoPublicacion, FormatoPublicacionForm>, IFormatoPublicacionMapper
    {
        public FormatoPublicacionMapper(IRepository<FormatoPublicacion> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(FormatoPublicacionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(FormatoPublicacionForm message, FormatoPublicacion model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
