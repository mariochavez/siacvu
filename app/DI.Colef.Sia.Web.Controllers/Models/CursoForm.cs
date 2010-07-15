namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class CursoForm : BaseForm
    {
        public string Nombre { get; set; }
        public int TipoCurso { get; set; }
        public string FechaInicial { get; set; }
        public string FechaFinal { get; set; }
        public int NumeroHoras { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }
        public string ProgramaEstudio { get; set; }
        public bool TieneConvenio { get; set; }
        public bool PertenecePNPC { get; set; }
        public bool EsPrivada { get; set; }

        public int NivelEstudio { get; set; }
        public int NivelEstudioId { get; set; }
        public string NivelEstudioNombre { get; set; }

        public int SectorId { get; set; }
        public int OrganizacionId { get; set; }
        public int Nivel2Id { get; set; }

        public string SectorNombre { get; set; }
        public string OrganizacionNombre { get; set; }
        public string Nivel2Nombre { get; set; }

        public int AreaId { get; set; }
        public int DisciplinaId { get; set; }
        public int SubdisciplinaId { get; set; }

        public string SubdisciplinaNombre { get; set; }
        public string DisciplinaNombre { get; set; }
        public string AreaNombre { get; set; }

        public int CursoInvestigadorId { get; set; }
        public string CursoInvestigadorNombre { get; set; }

        public ArchivoForm[] ArchivosCurso { get; set; }

        public override ArchivoForm[] Archivos
        {
            get { return ArchivosCurso; }
        }

        /*Show*/
        public CursoInvestigadorForm CursoInvestigador { get; set; }
        public ShowFieldsForm ShowFields { get; set; }
        public InstitucionForm Institucion { get; set; }

        /* Catalogos */
        public NivelEstudioForm[] NivelEstudios { get; set; }
        public CustomSelectForm[] TiposCursos { get; set; }
        public CursoInvestigadorForm[] CursosInvestigadores { get; set; }
        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
        public SectorForm[] Sectores { get; set; }
        public OrganizacionForm[] Organizaciones { get; set; }
        public NivelForm[] Niveles { get; set; }
    }
}