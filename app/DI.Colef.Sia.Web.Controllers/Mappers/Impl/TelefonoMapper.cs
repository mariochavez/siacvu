using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers.Impl
{
    public class TelefonoMapper : AutoFormMapper<Telefono, TelefonoForm>, ITelefonoMapper
    {
        public TelefonoMapper(IRepository<Telefono> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TelefonoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TelefonoForm message, Telefono model)
        {
            model.Numero = message.Numero;
        }
    }
}
