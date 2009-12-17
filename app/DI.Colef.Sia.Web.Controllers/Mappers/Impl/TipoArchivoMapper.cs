using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoArchivoMapper : AutoFormMapper<TipoArchivo, TipoArchivoForm>, ITipoArchivoMapper
    {
        public TipoArchivoMapper(IRepository<TipoArchivo> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TipoArchivoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoArchivoForm message, TipoArchivo model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
