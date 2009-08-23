using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class RevistaPublicacionMapper : AutoFormMapper<RevistaPublicacion, RevistaPublicacionForm>, IRevistaPublicacionMapper
    {
        readonly ICatalogoService catalogoService;

        public RevistaPublicacionMapper(IRepository<RevistaPublicacion> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(RevistaPublicacionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(RevistaPublicacionForm message, RevistaPublicacion model)
        {
            model.Titulo = message.Titulo;
            model.Periodicidad = message.Periodicidad;
            model.Issn = message.Issn;
            model.Detalle = message.Detalle;
            model.Tipo = message.Tipo;
            model.Estado = message.Estado;

            model.Institucion = catalogoService.GetInstitucionById(message.Institucion);
        }
    }
}
