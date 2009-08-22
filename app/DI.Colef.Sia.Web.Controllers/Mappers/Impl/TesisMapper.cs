using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TesisMapper : AutoFormMapper<Tesis, TesisForm>, ITesisMapper
    {
		readonly ICatalogoService catalogoService;

		public TesisMapper(IRepository<Tesis> repository, ICatalogoService catalogoService) 
			: base(repository)
        {
			this.catalogoService = catalogoService;
        }		
		
        protected override int GetIdFromMessage(TesisForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TesisForm message, Tesis model)
        {
            model.Titulo = message.Titulo;
            model.Autor = message.Autor;
            model.FechaConclusion = message.FechaConclusion.FromShortDateToDateTime();
            model.FechaGrado = message.FechaGrado.FromShortDateToDateTime();

            model.GradoAcademico = catalogoService.GetGradoAcademicoById(message.GradoAcademico);
            model.Pais = catalogoService.GetPaisById(message.Pais);
            model.FormaParticipacion = catalogoService.GetFormaParticipacionById(message.FormaParticipacion);
            model.Institucion = catalogoService.GetInstitucionById(message.Institucion);
            model.ProgramaEstudio = catalogoService.GetProgramaEstudioById(message.ProgramaEstudio);
            model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematica);
            model.Sector = catalogoService.GetSectorById(message.Sector);
            model.Dependencia = catalogoService.GetDependenciaById(message.Dependencia);
            model.Departamento = catalogoService.GetDepartamentoById(message.Departamento);
            model.Area = catalogoService.GetAreaById(message.Area);
            model.Disciplina = catalogoService.GetDisciplinaById(message.Disciplina);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.Subdisciplina);
        }

        public Tesis Map(TesisForm message, Usuario usuario, Investigador investigador, PeriodoReferencia periodo)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Investigador = investigador;
                model.CreadorPor = usuario;
                model.PeriodoReferencia = periodo;
            }

            model.ModificadoPor = usuario;

            return model;
        }
    }
}
