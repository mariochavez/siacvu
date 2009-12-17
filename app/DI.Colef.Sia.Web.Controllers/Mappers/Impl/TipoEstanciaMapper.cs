using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoEstanciaMapper : AutoFormMapper<TipoEstancia, TipoEstanciaForm>, ITipoEstanciaMapper
    {
        public TipoEstanciaMapper(IRepository<TipoEstancia> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TipoEstanciaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoEstanciaForm message, TipoEstancia model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
