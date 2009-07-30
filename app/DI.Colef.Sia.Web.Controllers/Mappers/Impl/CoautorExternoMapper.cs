using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CoautorExternoMapper : AutoFormMapper<CoautorExterno, CoautorExternoForm>, ICoautorExternoMapper
    {
        public CoautorExternoMapper(IRepository<CoautorExterno> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(CoautorExternoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CoautorExternoForm message, CoautorExterno model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
