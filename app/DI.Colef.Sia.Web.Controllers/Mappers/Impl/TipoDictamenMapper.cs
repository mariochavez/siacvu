using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoDictamenMapper : AutoFormMapper<TipoDictamen, TipoDictamenForm>, ITipoDictamenMapper
    {
        public TipoDictamenMapper(IRepository<TipoDictamen> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TipoDictamenForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoDictamenForm message, TipoDictamen model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
