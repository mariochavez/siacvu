using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class LineaTematicaMapper : AutoFormMapper<LineaTematica, CatalogoForm>, ILineaTematicaMapper
    {
        public LineaTematicaMapper(IRepository<LineaTematica> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(CatalogoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CatalogoForm message, LineaTematica model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
