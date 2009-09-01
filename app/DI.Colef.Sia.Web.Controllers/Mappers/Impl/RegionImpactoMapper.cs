using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class RegionImpactoMapper : AutoFormMapper<RegionImpacto, RegionImpactoForm>, IRegionImpactoMapper
    {
        public RegionImpactoMapper(IRepository<RegionImpacto> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(RegionImpactoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(RegionImpactoForm message, RegionImpacto model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
