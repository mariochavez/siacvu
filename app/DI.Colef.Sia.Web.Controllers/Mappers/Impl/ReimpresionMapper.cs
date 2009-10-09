using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ReimpresionMapper : AutoFormMapper<Reimpresion, ReimpresionForm>, IReimpresionMapper
    {
        public ReimpresionMapper(IRepository<Reimpresion> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(ReimpresionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ReimpresionForm message, Reimpresion model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
