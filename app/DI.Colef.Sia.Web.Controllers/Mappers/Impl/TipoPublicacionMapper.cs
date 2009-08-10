using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoPublicacionMapper : AutoFormMapper<TipoPublicacion, TipoPublicacionForm>, ITipoPublicacionMapper
    {
        public TipoPublicacionMapper(IRepository<TipoPublicacion> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TipoPublicacionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoPublicacionForm message, TipoPublicacion model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
