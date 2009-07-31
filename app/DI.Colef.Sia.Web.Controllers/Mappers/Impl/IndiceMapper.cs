using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class IndiceMapper : AutoFormMapper<Indice, IndiceForm>, IIndiceMapper
    {
        public IndiceMapper(IRepository<Indice> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(IndiceForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(IndiceForm message, Indice model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
