using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class FondoConacytMapper : AutoFormMapper<FondoConacyt, FondoConacytForm>, IFondoConacytMapper
    {
        public FondoConacytMapper(IRepository<FondoConacyt> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(FondoConacytForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(FondoConacytForm message, FondoConacyt model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
