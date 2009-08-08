using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoFinanciamientoMapper : AutoFormMapper<TipoFinanciamiento, TipoFinanciamientoForm>, ITipoFinanciamientoMapper
    {
        public TipoFinanciamientoMapper(IRepository<TipoFinanciamiento> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TipoFinanciamientoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoFinanciamientoForm message, TipoFinanciamiento model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
