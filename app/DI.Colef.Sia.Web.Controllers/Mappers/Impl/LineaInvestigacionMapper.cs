using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class LineaInvestigacionMapper : AutoFormMapper<LineaInvestigacion, LineaInvestigacionForm>, ILineaInvestigacionMapper
    {
        public LineaInvestigacionMapper(IRepository<LineaInvestigacion> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(LineaInvestigacionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(LineaInvestigacionForm message, LineaInvestigacion model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
