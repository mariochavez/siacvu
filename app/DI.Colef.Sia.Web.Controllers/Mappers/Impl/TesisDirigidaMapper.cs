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

		public TesisDirigidaMapper(IRepository<TesisDirigida> repository, ICatalogoService catalogoService) 
			: base(repository)
        {
			this.catalogoService = catalogoService;
        }		
		
        protected override int GetIdFromMessage(TesisDirigidaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TesisDirigidaForm message, TesisDirigida model)
        {
            model.Titulo = message.Titulo;
            model.Autor = message.Autor;
            model.FechaConclusion = message.FechaConclusion.FromShortDateToDateTime();
            model.FechaGrado = message.FechaGrado.FromShortDateToDateTime();

            model.GradoAcademico = catalogoService.GetGradoAcademicoById(message.GradoAcademico);
            model.Pais = catalogoService.GetPaisById(message.Pais);
            model.FormaParticipacion = catalogoService.GetFormaParticipacionById(message.FormaParticipacion);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.ProgramaEstudio = catalogoService.GetProgramaEstudioById(message.ProgramaEstudioId);
            model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematicaId);
            model.Sector = catalogoService.GetSectorById(message.Sector);
            model.Dependencia = catalogoService.GetDependenciaById(message.Dependencia);
            model.Departamento = catalogoService.GetDepartamentoById(message.Departamento);
            model.Area = catalogoService.GetAreaById(message.Area);
            model.Disciplina = catalogoService.GetDisciplinaById(message.Disciplina);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.Subdisciplina);
        }

        public TesisDirigida Map(TesisDirigidaForm message, Usuario usuario, PeriodoReferencia periodo)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadorPor = usuario;
                model.PeriodoReferencia = periodo;
            }

            model.ModificadoPor = usuario;

            return model;
        }
    }
}
