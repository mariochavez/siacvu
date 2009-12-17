using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoActividadMapper : AutoFormMapper<TipoActividad, TipoActividadForm>, ITipoActividadMapper
    {
        public TipoActividadMapper(IRepository<TipoActividad> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TipoActividadForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoActividadForm message, TipoActividad model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
