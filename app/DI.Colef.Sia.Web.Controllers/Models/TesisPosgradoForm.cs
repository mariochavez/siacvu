namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class TesisPosgradoForm
    {
        public int Id { get; set; }
        public string Titulo { get; set; }
        public string NombreAlumno { get; set; }
        public string FechaGrado { get; set; }

        public int VinculacionAPyD { get; set; }
        public string VinculacionAPyDNombre { get; set; }

        public int FormaParticipacion { get; set; }
        public string FormaParticipacionNombre { get; set; }

        public int ProgramaEstudio { get; set; }
        public string ProgramaEstudioNombre { get; set; }

        public int GradoAcademico { get; set; }
        public string GradoAcademicoNombre { get; set; }
    }
}