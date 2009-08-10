using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoReporteMapper : AutoFormMapper<TipoReporte, TipoReporteForm>, ITipoReporteMapper
    {
        public TipoReporteMapper(IRepository<TipoReporte> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TipoReporteForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoReporteForm message, TipoReporte model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
