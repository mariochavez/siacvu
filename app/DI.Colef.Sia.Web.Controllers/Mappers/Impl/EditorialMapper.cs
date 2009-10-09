using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class EditorialMapper : AutoFormMapper<Editorial, EditorialForm>, IEditorialMapper
    {
        readonly ICatalogoService catalogoService;

        public EditorialMapper(IRepository<Editorial> repository,
            ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(EditorialForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(EditorialForm message, Editorial model)
        {
			model.Nombre = message.Nombre;
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.Pais = catalogoService.GetPaisById(message.Pais);
        }
    }
}