using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class EstudianteProyectoForm
    {
        public int Id { get; set; }
        public string Modificacion { get; set; }
        public bool Activo { get; set; }

        public string NombreEstudiante { get; set; }

        public int TipoEstudiante { get; set; }

        public int GradoAcademico { get; set; }
        public int GradoAcademicoId { get; set; }
        public string GradoAcademicoNombre { get; set; }

        public int ParentId { get; set; }
    }
}