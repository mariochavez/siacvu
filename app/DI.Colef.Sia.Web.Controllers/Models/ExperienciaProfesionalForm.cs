namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ExperienciaProfesionalForm
    {
        public int Id { get; set; }
        public string Entidad { get; set; }
        public string Nombramiento { get; set; }
        public string FechaInicial { get; set; }
        public string FechaFinal { get; set; }
        public string LineaInvestigacion1 { get; set; }
        public string LineaInvestigacion2 { get; set; }
        public string LineaInvestigacion3 { get; set; }
        public string PrincipalesLogros { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        //Espacio para Agregar Mapeos
        public int Sector { get; set; }
        public int SectorId { get; set; }
        public string SectorNombre { get; set; }

        public int Organizacion { get; set; }
        public int OrganizacionId { get; set; }
        public string OrganizacionNombre { get; set; }

        public int Nivel2 { get; set; }
        public int Nivel2Id { get; set; }
        public string Nivel2Nombre { get; set; }

        public int Nivel3 { get; set; }
        public int Nivel3Id { get; set; }
        public string Nivel3Nombre { get; set; }

        public int Nivel4 { get; set; }
        public int Nivel4Id { get; set; }
        public string Nivel4Nombre { get; set; }

        public int Nivel5 { get; set; }
        public int Nivel5Id { get; set; }
        public string Nivel5Nombre { get; set; }

        public int Nivel6 { get; set; }
        public int Nivel6Id { get; set; }
        public string Nivel6Nombre { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }
        public string PaisNombre { get; set; }

        public int Area { get; set; }
        public int AreaId { get; set; }
        public string AreaNombre { get; set; }

        public int Disciplina { get; set; }
        public int DisciplinaId { get; set; }
        public string DisciplinaNombre { get; set; }

        public int Subdisciplina { get; set; }
        public int SubdisciplinaId { get; set; }
        public string SubdisciplinaNombre { get; set; }

        public int SectorEconomico { get; set; }
        public int SectorEconomicoId { get; set; }
        public string SectorEconomicoNombre { get; set; }

        public int Rama { get; set; }
        public int RamaId { get; set; }
        public string RamaNombre { get; set; }

        public int Clase { get; set; }
        public int ClaseId { get; set; }
        public string ClaseNombre { get; set; }

        /* Catalogos */
        public SectorForm[] Sectores { get; set; }
        public OrganizacionForm[] Organizaciones { get; set; }
        public NivelForm[] Niveles2 { get; set; }
        public NivelForm[] Niveles3 { get; set; }
        public NivelForm[] Niveles4 { get; set; }
        public NivelForm[] Niveles5 { get; set; }
        public NivelForm[] Niveles6 { get; set; }
        public PaisForm[] Paises { get; set; }
        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
        public SectorForm[] SectoresEconomicos { get; set; }
        public RamaForm[] Ramas { get; set; }
        public ClaseForm[] Clases { get; set; }
    }
}
