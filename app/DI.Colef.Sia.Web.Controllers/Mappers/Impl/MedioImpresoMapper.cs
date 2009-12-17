using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class MedioImpresoMapper : AutoFormMapper<MedioImpreso, MedioImpresoForm>, IMedioImpresoMapper
    {
        public MedioImpresoMapper(IRepository<MedioImpreso> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(MedioImpresoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(MedioImpresoForm message, MedioImpreso model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
