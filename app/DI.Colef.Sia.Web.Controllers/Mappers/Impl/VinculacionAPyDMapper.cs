using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class VinculacionAPyDMapper : AutoFormMapper<VinculacionAPyD, VinculacionAPyDForm>, IVinculacionAPyDMapper
    {
        public VinculacionAPyDMapper(IRepository<VinculacionAPyD> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(VinculacionAPyDForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(VinculacionAPyDForm message, VinculacionAPyD model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
