using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CorreoElectronicoMapper : AutoFormMapper<CorreoElectronico, CorreoElectronicoForm>, ICorreoElectronicoMapper
    {
        public CorreoElectronicoMapper(IRepository<CorreoElectronico> repository)
            : base(repository)
        {
        }

        protected override int GetIdFromMessage(CorreoElectronicoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CorreoElectronicoForm message, CorreoElectronico model)
        {
            model.Direccion = message.Direccion;
        }
    }
}
