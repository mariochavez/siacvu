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

            model.FechaInicial = message.FechaInicial.FromShortDateToDateTime();
            model.FechaFinal = message.FechaFinal.FromShortDateToDateTime();
            
            model.ProgramaEstudio = catalogoService.GetProgramaEstudioById(message.ProgramaEstudioId);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);

            model.NivelEstudio = catalogoService.GetNivelEstudioById(message.NivelEstudio);
            model.CursoInvestigador = cursoInvestigadorService.GetCursoInvestigadorById(message.CursoInvestigadorId);
            model.Sector = catalogoService.GetSectorById(message.SectorId);
            model.Organizacion = catalogoService.GetOrganizacionById(message.OrganizacionId);
            model.Nivel2 = catalogoService.GetNivelById(message.Nivel2Id);

            model.Area = catalogoService.GetAreaById(message.AreaId);
            model.Disciplina = catalogoService.GetDisciplinaById(message.DisciplinaId);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.SubdisciplinaId);
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
    }
}
