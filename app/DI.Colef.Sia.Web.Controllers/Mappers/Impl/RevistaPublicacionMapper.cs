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
            model.DepartamentoAcademico = message.DepartamentoAcademico;
            model.Issn = message.Issn;
            model.Issne = message.Issne;
            model.Contacto = message.Contacto;
            model.Email = message.Email;
            model.PaginaWeb = message.PaginaWeb;
            model.Telefono = message.Telefono;
            model.TipoRevista = message.TipoRevista;
            model.ClasificacionSieva = message.ClasificacionSieva;
            model.DescripcionRevista = message.DescripcionRevista;
            model.FactorImpacto = message.FactorImpacto;
            model.FormatoRevista = message.FormatoRevista;
            model.Periodicidad = message.Periodicidad;

            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.Indice1 = catalogoService.GetIndiceById(message.Indice1);
            model.Indice2 = catalogoService.GetIndiceById(message.Indice2);
            model.Indice3 = catalogoService.GetIndiceById(message.Indice3);
            model.AreaInvestigacion = catalogoService.GetAreaInvestigacionById(message.AreaInvestigacion);
            model.Pais = catalogoService.GetPaisById(message.Pais);
        }
    }
}