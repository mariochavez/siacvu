using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class DireccionMapper : AutoFormMapper<Direccion, DireccionForm>, IDireccionMapper
    {
        readonly ICatalogoService catalogoService;

        public DireccionMapper(IRepository<Direccion> repository, ICatalogoService catalogoService) : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(DireccionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(DireccionForm message, Direccion model)
        {
            model.Ciudad = message.Ciudad;
            model.LineaDireccion = message.LineaDireccion;
            model.Pais = catalogoService.GetPaisById(message.Pais);
            model.EstadoPais = catalogoService.GetEstadoPaisById(message.EstadoPais);
        }

        public Direccion Map(DireccionForm message, Usuario usuario)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.CreadoPor = usuario;
            }

            model.ModificadoPor = usuario;

            return model;
        }
    }
}
