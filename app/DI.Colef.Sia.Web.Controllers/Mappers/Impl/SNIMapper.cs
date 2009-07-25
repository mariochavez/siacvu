using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class SNIMapper : AutoFormMapper<SNI, SNIForm>, ISNIMapper
    {
        public SNIMapper(IRepository<SNI> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(SNIForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(SNIForm message, SNI model)
        {
            model.Activo = message.Activo;
			model.Nombre = message.Nombre;
        }
    }
}
