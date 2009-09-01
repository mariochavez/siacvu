using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class SectorFinanciamientoMapper : AutoFormMapper<SectorFinanciamiento, SectorFinanciamientoForm>, ISectorFinanciamientoMapper
    {
        public SectorFinanciamientoMapper(IRepository<SectorFinanciamiento> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(SectorFinanciamientoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(SectorFinanciamientoForm message, SectorFinanciamiento model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
