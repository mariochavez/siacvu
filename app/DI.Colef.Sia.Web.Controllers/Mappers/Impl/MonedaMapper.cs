using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class MonedaMapper : AutoFormMapper<Moneda, MonedaForm>, IMonedaMapper
    {
        public MonedaMapper(IRepository<Moneda> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(MonedaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(MonedaForm message, Moneda model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
