using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class EdicionMapper : AutoFormMapper<Edicion, EdicionForm>, IEdicionMapper
    {
        public EdicionMapper(IRepository<Edicion> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(EdicionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(EdicionForm message, Edicion model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
