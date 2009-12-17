using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class MedioElectronicoMapper : AutoFormMapper<MedioElectronico, MedioElectronicoForm>, IMedioElectronicoMapper
    {
        public MedioElectronicoMapper(IRepository<MedioElectronico> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(MedioElectronicoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(MedioElectronicoForm message, MedioElectronico model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
