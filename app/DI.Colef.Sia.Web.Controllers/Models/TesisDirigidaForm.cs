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

        public int GradoAcademico { get; set; }
        public int GradoAcademicoId { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }

        public int FormaParticipacion { get; set; }
        public int FormaParticipacionId { get; set; }

        public int InstitucionId { get; set; }
        public string InstitucionNombre { get; set; }

        public int ProgramaEstudioId { get; set; }
        public string ProgramaEstudioNombre { get; set; }

        public int LineaTematicaId { get; set; }
        public string LineaTematicaNombre { get; set; }

        public int Sector { get; set; }
        public int SectorId { get; set; }

        public int Dependencia { get; set; }
        public int DependenciaId { get; set; }

        public int Departamento { get; set; }
        public int DepartamentoId { get; set; }

        public int Area { get; set; }
        public int AreaId { get; set; }

        public int Disciplina { get; set; }
        public int DisciplinaId { get; set; }

        public int Subdisciplina { get; set; }
        public int SubdisciplinaId { get; set; }

        public string PeriodoReferenciaPeriodo { get; set; }

        /* Catalogos */
        public GradoAcademicoForm[] GradosAcademicos { get; set; }
        public PaisForm[] Paises { get; set; }
        public FormaParticipacionForm[] FormasParticipaciones { get; set; }
        public SectorForm[] Sectores { get; set; }
        public DependenciaForm[] Dependencias { get; set; }
        public DepartamentoForm[] Departamentos { get; set; }
        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
    }
}
