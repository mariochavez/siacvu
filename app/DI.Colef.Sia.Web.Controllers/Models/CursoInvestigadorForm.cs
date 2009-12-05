namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class CursoInvestigadorForm
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string NombreInvestigador { get; set; }
        public string FechaInicial { get; set; }
        public string FechaFinal { get; set; }
        public int NumeroHoras { get; set; }

        public int ProgramaEstudioId { get; set; }
        public string ProgramaEstudioNombre { get; set; }

        public int InstitucionId { get; set; }
        public string InstitucionNombre { get; set; }
        public string InstitucionPaisNombre { get; set; }

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
    }
}