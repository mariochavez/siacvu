using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ResponsableExternoMapper : AutoFormMapper<ResponsableExterno, ResponsableExternoForm>, IResponsableExternoMapper
    {
        public ResponsableExternoMapper(IRepository<ResponsableExterno> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(ResponsableExternoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ResponsableExternoForm message, ResponsableExterno model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
