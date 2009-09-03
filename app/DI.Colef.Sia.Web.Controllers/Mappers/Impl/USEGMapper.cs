using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class USEGMapper : AutoFormMapper<USEG, USEGForm>, IUSEGMapper
    {
        public USEGMapper(IRepository<USEG> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(USEGForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(USEGForm message, USEG model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
