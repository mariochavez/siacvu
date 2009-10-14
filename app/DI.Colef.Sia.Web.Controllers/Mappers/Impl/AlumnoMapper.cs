using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class AlumnoMapper : AutoFormMapper<Alumno, AlumnoForm>, IAlumnoMapper
    {
        readonly ICatalogoService catalogoService;

        public AlumnoMapper(IRepository<Alumno> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(AlumnoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(AlumnoForm message, Alumno model)
        {
            model.Nombre = message.Nombre;

            model.GradoAcademico = catalogoService.GetGradoAcademicoById(message.GradoAcademico);
            model.ProgramaEstudio = catalogoService.GetProgramaEstudioById(message.ProgramaEstudio);
        }
    }
}