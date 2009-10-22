namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class TesisDirigidaForm
    {
        public int Id { get; set; }
        public string Titulo { get; set; }
        public string FechaConclusion { get; set; }
        //public string Autor { get; set; }
        public string FechaGrado { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }
        public string NombreAlumno { get; set; }
        public string DepartamentoInvestigadorNombre { get; set; }
        public string SedeNombre { get; set; }
        public bool Concluida { get; set; }

        public int TipoEstudiante { get; set; }
        //public int TipoEstudianteId { get; set; }
        //public string TipoEstudianteNombre { get; set; }

        public int VinculacionAPyD { get; set; }
        public int VinculacionAPyDId { get; set; }
        public string VinculacionAPyDNombre { get; set; }

        public int GradoAcademico { get; set; }
        public int GradoAcademicoId { get; set; }
        public string GradoAcademicoNombre { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }
        public string PaisNombre { get; set; }

        public int FormaParticipacion { get; set; }
        public int FormaParticipacionId { get; set; }
        public string FormaParticipacionNombre { get; set; }

        public int InstitucionId { get; set; }
        public string InstitucionNombre { get; set; }
        public string InstitucionPaisNombre { get; set; }

        public string SectorNombre { get; set; }
        public string OrganizacionNombre { get; set; }
        public int Nivel2 { get; set; }
        public int Nivel2Id { get; set; }
        public string Nivel2Nombre { get; set; }

        public string AreaNombre { get; set; }
        public string DisciplinaNombre { get; set; }
        public int Subdisciplina { get; set; }
        public int SubdisciplinaId { get; set; }
        public string SubdisciplinaNombre { get; set; }

        public int Alumno { get; set; }
        public int AlumnoId { get; set; }
        public string AlumnoNombre { get; set; }
        public string AlumnoProgramaEstudioNombre { get; set; }
        public string AlumnoGradoAcademicoNombre { get; set; }

        /* Catalogos */
        public AlumnoForm[] Alumnos { get; set; }
        public GradoAcademicoForm[] GradosAcademicos { get; set; }
        public PaisForm[] Paises { get; set; }
        public FormaParticipacionForm[] FormasParticipaciones { get; set; }
        public NivelForm[] Niveles2 { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
        public CustomSelectForm[] TiposEstudiantes { get; set; }
        public VinculacionAPyDForm[] VinculacionesAPyDs { get; set; }
    }
}
