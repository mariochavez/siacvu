using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class IdentificadorLibroMapper : AutoFormMapper<IdentificadorLibro, IdentificadorLibroForm>, IIdentificadorLibroMapper
    {
        public IdentificadorLibroMapper(IRepository<IdentificadorLibro> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(IdentificadorLibroForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(IdentificadorLibroForm message, IdentificadorLibro model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
