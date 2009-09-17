using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class SectorMapper : AutoFormMapper<Sector, SectorForm>, ISectorMapper
    {
        public SectorMapper(IRepository<Sector> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(SectorForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(SectorForm message, Sector model)
        {
			model.Nombre = message.Nombre;
            model.SectorEconomico = message.SectorEconomico;
        }
    }
}
