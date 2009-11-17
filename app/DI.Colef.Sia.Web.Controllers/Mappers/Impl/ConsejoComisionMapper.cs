using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ConsejoComisionMapper : AutoFormMapper<ConsejoComision, ConsejoComisionForm>, IConsejoComisionMapper
    {
        public ConsejoComisionMapper(IRepository<ConsejoComision> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(ConsejoComisionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ConsejoComisionForm message, ConsejoComision model)
        {
			model.Nombre = message.Nombre;
		    model.Duracion = message.Duracion;
		    model.Reeleccion = message.Reeleccion;
        }
    }
}