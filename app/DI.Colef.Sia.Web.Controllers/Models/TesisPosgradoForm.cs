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

        public int ProgramaEstudioId { get; set; }
        public string ProgramaEstudioNombre { get; set; }

        public int GradoAcademico { get; set; }
        public string GradoAcademicoNombre { get; set; }

        public int InstitucionId { get; set; }
        public string InstitucionNombre { get; set; }
        public string InstitucionPaisNombre { get; set; }

        public int SectorId { get; set; }
        public int OrganizacionId { get; set; }
        public int Nivel2Id { get; set; }

        public string SectorNombre { get; set; }
        public string OrganizacionNombre { get; set; }
        public string Nivel2Nombre { get; set; }

        //public int AreaId { get; set; }
        //public int DisciplinaId { get; set; }
        //public int SubdisciplinaId { get; set; }

        //public string SubdisciplinaNombre { get; set; }
        //public string DisciplinaNombre { get; set; }
        //public string AreaNombre { get; set; }
    }
}