using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class DisciplinaMapper : AutoFormMapper<Disciplina, DisciplinaForm>, IDisciplinaMapper
    {
        public DisciplinaMapper(IRepository<Disciplina> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(DisciplinaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(DisciplinaForm message, Disciplina model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
