using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TesisDirigidaMapper : AutoFormMapper<TesisDirigida, TesisDirigidaForm>, ITesisDirigidaMapper
    {
		readonly ICatalogoService catalogoService;
        readonly IAlumnoService alumnoService;

		public TesisDirigidaMapper(IRepository<TesisDirigida> repository, ICatalogoService catalogoService,
                                   IAlumnoService alumnoService) 
			: base(repository)
        {
			this.catalogoService = catalogoService;
		    this.alumnoService = alumnoService;
        }		
		
        protected override int GetIdFromMessage(TesisDirigidaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TesisDirigidaForm message, TesisDirigida model)
        {
            model.Titulo = message.Titulo;
            model.NombreAlumno = message.NombreAlumno;
            model.Concluida = message.Concluida;
            model.TipoEstudiante = message.TipoEstudiante;

            model.FechaConclusion = message.FechaConclusion.FromShortDateToDateTime();
            model.FechaGrado = message.FechaGrado.FromShortDateToDateTime();

            model.Alumno = alumnoService.GetAlumnoById(message.Alumno);
            model.GradoAcademico = catalogoService.GetGradoAcademicoById(message.GradoAcademico);
            model.Pais = catalogoService.GetPaisById(message.Pais);
            model.FormaParticipacion = catalogoService.GetFormaParticipacionById(message.FormaParticipacion);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.VinculacionAPyD = catalogoService.GetVinculacionAPyDById(message.VinculacionAPyD);

            // Sector - Organizacion - Nivel2 son en forma de cascada
            model.Nivel2 = catalogoService.GetNivelById(message.Nivel2);

            var organizacion = catalogoService.GetNivelById(message.Nivel2).Organizacion.Id;
            model.Organizacion = catalogoService.GetOrganizacionById(organizacion);

            var sector = catalogoService.GetOrganizacionById(organizacion).Sector.Id;
            model.Sector = catalogoService.GetSectorById(sector);

            // Area - Disciplina - Subdisciplina son en forma de cascada
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.Subdisciplina);

            var disciplina = catalogoService.GetSubdisciplinaById(message.Subdisciplina).Disciplina.Id;
            model.Disciplina = catalogoService.GetDisciplinaById(disciplina);

            var area = catalogoService.GetDisciplinaById(disciplina).Area.Id;
            model.Area = catalogoService.GetAreaById(area);
        }

        public TesisDirigida Map(TesisDirigidaForm message, Usuario usuario, Investigador investigador)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadorPor = usuario;
                model.Sede = GetLatest(investigador.CargosInvestigador).Sede;
                model.DepartamentoInvestigador = GetLatest(investigador.CargosInvestigador).Departamento;
            }

            model.ModificadoPor = usuario;

            return model;
        }
    }
}
