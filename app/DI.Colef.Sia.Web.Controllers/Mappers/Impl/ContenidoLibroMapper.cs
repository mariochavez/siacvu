using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ContenidoLibroMapper : AutoFormMapper<ContenidoLibro, ContenidoLibroForm>, IContenidoLibroMapper
    {
        public ContenidoLibroMapper(IRepository<ContenidoLibro> repository) : base(repository)
        {

        }

        protected override int GetIdFromMessage(ContenidoLibroForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ContenidoLibroForm message, ContenidoLibro model)
        {
			model.Nombre = message.Nombre;
        }
    }
}