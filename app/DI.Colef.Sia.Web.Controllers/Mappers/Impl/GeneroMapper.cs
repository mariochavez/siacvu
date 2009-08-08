using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class GeneroMapper : AutoFormMapper<Genero, GeneroForm>, IGeneroMapper
    {
        public GeneroMapper(IRepository<Genero> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(GeneroForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(GeneroForm message, Genero model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
