using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class AreaInvestigacionMapper : AutoFormMapper<AreaInvestigacion, AreaInvestigacionForm>, IAreaInvestigacionMapper
    {
        public AreaInvestigacionMapper(IRepository<AreaInvestigacion> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(AreaInvestigacionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(AreaInvestigacionForm message, AreaInvestigacion model)
        {
			model.Nombre = message.Nombre;
        }
    }
}