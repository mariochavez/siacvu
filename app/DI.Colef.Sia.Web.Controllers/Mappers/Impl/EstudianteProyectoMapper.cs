using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class EstudianteProyectoMapper: AutoFormMapper<EstudianteProyecto, EstudianteProyectoForm>, IEstudianteProyectoMapper
    {
        readonly ICatalogoService catalogoService;

        public EstudianteProyectoMapper(IRepository<EstudianteProyecto> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(EstudianteProyectoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(EstudianteProyectoForm message, EstudianteProyecto model)
        {
            model.NombreEstudiante = message.NombreEstudiante;

            model.TipoEstudiante = message.TipoEstudiante;
            model.GradoAcademico = catalogoService.GetGradoAcademicoById(message.GradoAcademico);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadoEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}