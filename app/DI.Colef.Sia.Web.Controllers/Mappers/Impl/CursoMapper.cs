using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CursoMapper : AutoFormMapper<Curso, CursoForm>, ICursoMapper
    {
        readonly ICatalogoService catalogoService;
        readonly ICursoInvestigadorService cursoInvestigadorService;

        public CursoMapper(IRepository<Curso> repository, ICatalogoService catalogoService, ICursoInvestigadorService cursoInvestigadorService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
            this.cursoInvestigadorService = cursoInvestigadorService;
        }

        protected override int GetIdFromMessage(CursoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CursoForm message, Curso model)
        {
            model.NumeroHoras = message.NumeroHoras;
            model.Nombre = message.Nombre;
            model.TipoCurso = message.TipoCurso;
            model.ProgramaEstudio = message.ProgramaEstudio;
            model.TieneConvenio = message.TieneConvenio;
            model.PertenecePNPC = message.PertenecePNPC;
            model.EsPrivada = message.EsPrivada;

            model.FechaInicial = message.FechaInicial.FromShortDateToDateTime();
            model.FechaFinal = message.FechaFinal.FromShortDateToDateTime();
            
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.NivelEstudio = catalogoService.GetNivelEstudioById(message.NivelEstudio);
            model.CursoInvestigador = cursoInvestigadorService.GetCursoInvestigadorById(message.CursoInvestigadorId);
            model.Sector = catalogoService.GetSectorById(message.SectorId);
            model.Organizacion = catalogoService.GetOrganizacionById(message.OrganizacionId);
            model.Nivel2 = catalogoService.GetNivelById(message.Nivel2Id);

            model.Area = catalogoService.GetAreaById(message.AreaId);
            model.Disciplina = catalogoService.GetDisciplinaById(message.DisciplinaId);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.SubdisciplinaId);

            var institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            if (institucion != null && string.Compare(institucion.Nombre, message.InstitucionNombre) >= 0)
            {
                model.Institucion = institucion;
                model.InstitucionNombre = string.Empty;
            }
            else
            {
                model.InstitucionNombre = message.InstitucionNombre;
                model.Institucion = null;
            }
        }

        public Curso Map(CursoForm message, Usuario usuario)
        {
            var model = Map(message);

            model.ModificadoPor = usuario;

            return model;
        }

        public Curso Map(CursoForm message, Usuario usuario, Investigador investigador)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadoPor = usuario;
                model.Sede = GetLatest(investigador.CargosInvestigador).Sede;
                model.Departamento = GetLatest(investigador.CargosInvestigador).Departamento;
            }

            model.ModificadoPor = usuario;

            return model;
        }

        public override CursoForm Map(Curso model)
        {
            var message = base.Map(model);

            if (message.InstitucionId > 0)
                message.InstitucionNombre = model.Institucion.Nombre;

            return message;
        }
    }
}
