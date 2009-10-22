using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class LineaTematicaMapper : AutoFormMapper<LineaTematica, LineaTematicaForm>, ILineaTematicaMapper
    {
        public LineaTematicaMapper(IRepository<LineaTematica> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(LineaTematicaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(LineaTematicaForm message, LineaTematica model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
