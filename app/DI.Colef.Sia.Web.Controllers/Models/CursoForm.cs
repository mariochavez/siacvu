namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class CursoForm
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string FechaInicial { get; set; }
        public string FechaFinal { get; set; }
        public int NumeroHoras { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public int ProgramaEstudio { get; set; }
        public int ProgramaEstudioId { get; set; }

        public int Institucion { get; set; }
        public int InstitucionId { get; set; }

        public int Sector { get; set; }
        public int SectorId { get; set; }

        public int Organizacion { get; set; }
        public int OrganizacionId { get; set; }

        public int Nivel { get; set; }
        public int NivelId { get; set; }

        public int Nivel2 { get; set; }
        public int Nivel2Id { get; set; }

        public int Nivel3 { get; set; }
        public int Nivel3Id { get; set; }

        public int Nivel4 { get; set; }
        public int Nivel4Id { get; set; }

        public int Nivel5 { get; set; }
        public int Nivel5Id { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }

        public int Area { get; set; }
        public int AreaId { get; set; }

        public int Disciplina { get; set; }
        public int DisciplinaId { get; set; }

        public int Subdisciplina { get; set; }
        public int SubdisciplinaId { get; set; }

        public int Investigador { get; set; }

        public string PeriodoReferenciaPeriodo { get; set; }
        
        /* Catalogos */
        public ProgramaEstudioForm[] ProgramasEstudios { get; set; }
        public InstitucionForm[] Instituciones { get; set; }
        public SectorForm[] Sectores { get; set; }
        public OrganizacionForm[] Organizaciones { get; set; }
        public NivelForm[] Niveles { get; set; }
        public NivelForm[] Niveles2 { get; set; }
        public NivelForm[] Niveles3 { get; set; }
        public NivelForm[] Niveles4 { get; set; }
        public NivelForm[] Niveles5 { get; set; }
        public PaisForm[] Paises { get; set; }
        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
    }
}
