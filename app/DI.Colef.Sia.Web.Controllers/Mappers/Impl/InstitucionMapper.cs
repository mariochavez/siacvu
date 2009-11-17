using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class InstitucionMapper : AutoFormMapper<Institucion, InstitucionForm>, IInstitucionMapper
    {
        readonly ICatalogoService catalogoService;
        public InstitucionMapper(IRepository<Institucion> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(InstitucionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(InstitucionForm message, Institucion model)
        {
            model.Nombre = message.Nombre;
            model.Siglas = message.Siglas;
            model.Sede = message.Sede;
            model.PaginaWeb = message.PaginaWeb;
            model.Email = message.Email;
            model.Telefono = message.Telefono;
            model.TipoInstitucion = message.TipoInstitucion;
            model.Ciudad = message.Ciudad;

            model.Pais = catalogoService.GetPaisById(message.Pais);
            model.EstadoPais = catalogoService.GetEstadoPaisById(message.EstadoPais);
            model.Ambito = catalogoService.GetAmbitoById(message.Ambito);
            model.Sector = catalogoService.GetSectorById(message.Sector);
        }
    }
}