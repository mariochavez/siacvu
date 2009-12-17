using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class IdiomaMapper : AutoFormMapper<Idioma, IdiomaForm>, IIdiomaMapper
    {
        public IdiomaMapper(IRepository<Idioma> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(IdiomaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(IdiomaForm message, Idioma model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
