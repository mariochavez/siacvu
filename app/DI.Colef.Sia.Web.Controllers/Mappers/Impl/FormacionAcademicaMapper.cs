using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class FormacionAcademicaMapper : AutoFormMapper<FormacionAcademica, FormacionAcademicaForm>, IFormacionAcademicaMapper
    {
        readonly ICatalogoService catalogoService;

        public FormacionAcademicaMapper(IRepository<FormacionAcademica> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(FormacionAcademicaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(FormacionAcademicaForm message, FormacionAcademica model)
        {
            model.NumeroCedula = message.NumeroCedula;
            model.TituloGrado = message.TituloGrado;
            model.FechaObtencion = message.FechaObtencion.FromShortDateToDateTime();
            model.TituloTesis = message.TituloTesis;
            model.Ciudad = message.Ciudad;

            model.Estatus = catalogoService.GetEstatusFormacionAcademicaById(message.Estatus);
            model.NivelEstudio = catalogoService.GetNivelEstudioById(message.NivelEstudio);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematicaId);
            model.Pais = catalogoService.GetPaisById(message.Pais);
            model.EstadoPais = catalogoService.GetEstadoPaisById(message.EstadoPais);

            model.Sector = catalogoService.GetSectorById(message.SectorId);
            model.Organizacion = catalogoService.GetOrganizacionById(message.OrganizacionId);
            model.Nivel2 = catalogoService.GetNivelById(message.Nivel2Id);

            model.Area = catalogoService.GetAreaById(message.AreaId);
            model.Disciplina = catalogoService.GetDisciplinaById(message.DisciplinaId);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.SubdisciplinaId);
        }

        public FormacionAcademica Map(FormacionAcademicaForm message, Usuario usuario)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadorPor = usuario;
            }

            model.ModificadoPor = usuario;

            return model;
        }
    }
}
