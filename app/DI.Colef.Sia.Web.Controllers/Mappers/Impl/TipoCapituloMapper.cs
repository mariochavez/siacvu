using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoCapituloMapper : AutoFormMapper<TipoCapitulo, TipoCapituloForm>, ITipoCapituloMapper
    {
        public TipoCapituloMapper(IRepository<TipoCapitulo> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TipoCapituloForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoCapituloForm message, TipoCapitulo model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
