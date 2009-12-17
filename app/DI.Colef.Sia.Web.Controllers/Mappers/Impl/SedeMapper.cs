using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class SedeMapper : AutoFormMapper<Sede, SedeForm>, ISedeMapper
    {
        public SedeMapper(IRepository<Sede> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(SedeForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(SedeForm message, Sede model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
