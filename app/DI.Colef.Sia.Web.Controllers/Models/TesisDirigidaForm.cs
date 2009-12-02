namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class TesisDirigidaForm
    {
        public int Id { get; set; }
        public string Titulo { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }
        public string NombreAlumno { get; set; }
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }
        public string FechaGrado { get; set; }
        public int FormaParticipacion { get; set; }

        public int TipoTesis { get; set; }

        public int VinculacionAPyD { get; set; }
        public int VinculacionAPyDId { get; set; }
        public string VinculacionAPyDNombre { get; set; }

        public int GradoAcademico { get; set; }
        public int GradoAcademicoId { get; set; }
        public string GradoAcademicoNombre { get; set; }

        public int InstitucionId { get; set; }
        public string InstitucionNombre { get; set; }

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

        public int ProgramaEstudioId { get; set; }
        public string ProgramaEstudioNombre { get; set; }

        public int TesisPosgradoId { get; set; }
        public bool IsShowForm { get; set; }

        /*Show*/
        public TesisPosgradoForm TesisPosgrado { get; set; }
        public ShowFieldsForm ShowFields { get; set; }
        public InstitucionForm Institucion { get; set; }

        /* Catalogos */
        public GradoAcademicoForm[] GradosAcademicos { get; set; }
        public CustomSelectForm[] FormasParticipaciones { get; set; }
        public CustomSelectForm[] TiposTesis { get; set; }
        public VinculacionAPyDForm[] VinculacionesAPyDs { get; set; }
        public TesisPosgradoForm[] TesisPosgrados { get; set; }
        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
        public SectorForm[] Sectores { get; set; }
        public OrganizacionForm[] Organizaciones { get; set; }
        public NivelForm[] Niveles { get; set; }
    }
}
