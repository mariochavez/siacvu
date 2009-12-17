using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class EstadoPaisMapper : AutoFormMapper<EstadoPais, EstadoPaisForm>, IEstadoPaisMapper
    {
        private readonly ICatalogoService catalogoService;

        public EstadoPaisMapper(IRepository<EstadoPais> repository, ICatalogoService catalogoService) : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(EstadoPaisForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(EstadoPaisForm message, EstadoPais model)
        {
			model.Nombre = message.Nombre;
            model.Pais = catalogoService.GetPaisById(message.Pais);
        }
    }
}
