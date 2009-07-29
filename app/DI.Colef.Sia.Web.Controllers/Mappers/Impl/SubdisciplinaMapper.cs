using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class SubdisciplinaMapper : AutoFormMapper<Subdisciplina, SubdisciplinaForm>, ISubdisciplinaMapper
    {
        public SubdisciplinaMapper(IRepository<Subdisciplina> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(SubdisciplinaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(SubdisciplinaForm message, Subdisciplina model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
