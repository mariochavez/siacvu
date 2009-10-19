using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class AreaMapper : AutoFormMapper<Area, AreaForm>, IAreaMapper
    {
        readonly ICatalogoService catalogoService;

        public AreaMapper(IRepository<Area> repository,
                          ICatalogoService catalogoService) : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(AreaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(AreaForm message, Area model)
        {
			model.Nombre = message.Nombre;
            model.AreaTematica = catalogoService.GetAreaTematicaById(message.AreaTematica);
        }
    }
}
