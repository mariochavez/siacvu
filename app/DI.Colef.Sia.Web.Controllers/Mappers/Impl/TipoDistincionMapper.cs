using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoDistincionMapper : AutoFormMapper<TipoDistincion, TipoDistincionForm>, ITipoDistincionMapper
    {
        public TipoDistincionMapper(IRepository<TipoDistincion> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TipoDistincionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoDistincionForm message, TipoDistincion model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
