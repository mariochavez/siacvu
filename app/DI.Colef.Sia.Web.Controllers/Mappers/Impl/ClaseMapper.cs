using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ClaseMapper : AutoFormMapper<Clase, ClaseForm>, IClaseMapper
    {
        readonly ICatalogoService catalogoService;

        public ClaseMapper(IRepository<Clase> repository, ICatalogoService catalogoService) : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(ClaseForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ClaseForm message, Clase model)
        {
			model.Nombre = message.Nombre;
            model.Rama = catalogoService.GetRamaById(message.Rama);
        }
    }
}
