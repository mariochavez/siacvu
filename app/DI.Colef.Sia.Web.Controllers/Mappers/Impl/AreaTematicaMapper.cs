using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class AreaTematicaMapper : AutoFormMapper<AreaTematica, AreaTematicaForm>, IAreaTematicaMapper
    {
        readonly ICatalogoService catalogoService;

        public AreaTematicaMapper(IRepository<AreaTematica> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(AreaTematicaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(AreaTematicaForm message, AreaTematica model)
        {
			model.Nombre = message.Nombre;

            model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematica);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.Subdisciplina);
        }
    }
}
