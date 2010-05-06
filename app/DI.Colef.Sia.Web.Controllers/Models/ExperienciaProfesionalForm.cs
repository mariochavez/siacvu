namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ExperienciaProfesionalForm
    {
        public int Id { get; set; }
        public int Entidad { get; set; }
        public string Nombramiento { get; set; }
        public string FechaInicial { get; set; }
        public string FechaFinal { get; set; }
        public string LineaInvestigacion1 { get; set; }
        public string LineaInvestigacion2 { get; set; }
        public string LineaInvestigacion3 { get; set; }
        public string PrincipalesLogros { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public string EntidadNombre{ get; set;}
        public CustomSelectForm[] Entidades { get; set; }

        //Espacio para Agregar Mapeos
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

        public int SectorEconomicoId { get; set; }
        public int RamaId { get; set; }
        public int ClaseId { get; set; }

        public string SectorEconomicoNombre { get; set; }
        public string RamaNombre { get; set; }
        public string ClaseNombre { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }
        public string PaisNombre { get; set; }

        /* Show */
        public ShowFieldsForm ShowFields { get; set; }

        /* Catalogos */
        public PaisForm[] Paises { get; set; }
        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
        public SectorForm[] Sectores { get; set; }
        public OrganizacionForm[] Organizaciones { get; set; }
        public NivelForm[] Niveles { get; set; }
        public SectorForm[] SectoresEconomicos { get; set; }
        public RamaForm[] Ramas { get; set; }
        public ClaseForm[] Clases { get; set; }
    }
}