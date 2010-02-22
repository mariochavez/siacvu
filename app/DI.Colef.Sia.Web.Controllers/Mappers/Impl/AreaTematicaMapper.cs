using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class AreaTematicaMapper : AutoFormMapper<AreaTematica, AreaTematicaForm>, IAreaTematicaMapper
    {
        readonly IRepository<LineaTematica> repositoryLineaTematica;

        public AreaTematicaMapper(IRepository<AreaTematica> repository, IRepository<LineaTematica> repositoryLineaTematica)
            : base(repository)
        {
            this.repositoryLineaTematica = repositoryLineaTematica;
        }

        protected override int GetIdFromMessage(AreaTematicaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(AreaTematicaForm message, AreaTematica model)
        {
			model.Nombre = message.Nombre;
            model.LineaTematica = repositoryLineaTematica.Get(message.LineaTematicaId);
        }
    }
}
