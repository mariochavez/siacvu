using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class OrganizacionMapper : AutoFormMapper<Organizacion, OrganizacionForm>, IOrganizacionMapper
    {
        readonly ICatalogoService catalogoService;

        public OrganizacionMapper(IRepository<Organizacion> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(OrganizacionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(OrganizacionForm message, Organizacion model)
        {
			model.Nombre = message.Nombre;
            model.Sector = catalogoService.GetSectorById(message.Sector);
        }
    }
}
