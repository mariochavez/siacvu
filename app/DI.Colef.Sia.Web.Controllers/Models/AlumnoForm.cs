namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class AlumnoForm
    {
        public int Id { get; set; }
        public string Nombre { get; set; }

        public int ProgramaEstudio { get; set; }
        public int ProgramaEstudioId { get; set; }
        public string ProgramaEstudioNombre { get; set; }

        public int GradoAcademico { get; set; }
        public int GradoAcademicoId { get; set; }
        public string GradoAcademicoNombre { get; set; }
    }
}