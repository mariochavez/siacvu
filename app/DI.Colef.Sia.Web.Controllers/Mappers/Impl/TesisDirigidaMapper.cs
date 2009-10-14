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

            model.FechaConclusion = message.FechaConclusion.FromShortDateToDateTime();
            model.FechaGrado = message.FechaGrado.FromShortDateToDateTime();

            model.Alumno = alumnoService.GetAlumnoById(message.Alumno);

            model.GradoAcademico = catalogoService.GetGradoAcademicoById(message.GradoAcademico);
            model.Pais = catalogoService.GetPaisById(message.Pais);
            model.FormaParticipacion = catalogoService.GetFormaParticipacionById(message.FormaParticipacion);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.Sector = catalogoService.GetSectorById(message.Sector);
            model.Organizacion = catalogoService.GetOrganizacionById(message.Organizacion);
            model.Nivel2 = catalogoService.GetNivelById(message.Nivel2);
            model.Area = catalogoService.GetAreaById(message.Area);
            model.Disciplina = catalogoService.GetDisciplinaById(message.Disciplina);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.Subdisciplina);
            model.TipoEstudiante = message.TipoEstudiante;
            model.VinculacionAPyD = catalogoService.GetVinculacionAPyDById(message.VinculacionAPyD);
        }

        public TesisDirigida Map(TesisDirigidaForm message, Usuario usuario, PeriodoReferencia periodo, Investigador investigador)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadorPor = usuario;
                model.PeriodoReferencia = periodo;
                model.Sede = investigador.CargosInvestigador[investigador.CargosInvestigador.Count - 1].Sede;
                model.DepartamentoInvestigador = investigador.CargosInvestigador[investigador.CargosInvestigador.Count - 1].Departamento;
            }

            model.ModificadoPor = usuario;

            return model;
        }
    }
}
