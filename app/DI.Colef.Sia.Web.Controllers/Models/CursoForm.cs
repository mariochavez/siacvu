namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class CursoForm
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string NombreDiplomado { get; set; }
        public int TipoCurso { get; set; }
        public bool EsDiplomado { get; set; }
        public string FechaInicial { get; set; }
        public string FechaFinal { get; set; }
        public int NumeroHoras { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }

        public string ProgramaEstudioNombre { get; set; }
        public int ProgramaEstudioId { get; set; }

        public string InstitucionNombre { get; set; }
        public int InstitucionId { get; set; }

        public int NivelEstudio { get; set; }
        public int NivelEstudioId { get; set; }
        public string NivelEstudioNombre { get; set; }

        public string SectorNombre { get; set; }
        public string OrganizacionNombre { get; set; }
        public int Nivel2 { get; set; }
        public int Nivel2Id { get; set; }
        public string Nivel2Nombre { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }
        public string PaisNombre { get; set; }

        public int Diplomado { get; set; }
        public int DiplomadoId { get; set; }
        public string DiplomadoNombre { get; set; }

        public string AreaNombre { get; set; }
        public string DisciplinaNombre { get; set; }
        public int Subdisciplina { get; set; }
        public int SubdisciplinaId { get; set; }
        public string SubdisciplinaNombre { get; set; }

        /* Catalogos */
        public NivelEstudioForm[] NivelEstudios { get; set; }
        public NivelForm[] Niveles2 { get; set; }
        public PaisForm[] Paises { get; set; }
        public DiplomadoForm[] Diplomados { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
        public CustomSelectForm[] TiposCursos { get; set; }
    }
}