namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ShowFieldsForm
    {
        public string RevistaPublicacionTitulo { get; set; }
        public string RevistaPublicacionInstitucionNombre { get; set; }
        public string RevistaPublicacionIndice1Nombre { get; set; }
        public string RevistaPublicacionIndice2Nombre { get; set; }
        public string RevistaPublicacionIndice3Nombre { get; set; }

        public string AreaTematicaNombre { get; set; }
        public string AreaTematicaLineaTematicaNombre { get; set; }

        public string SubdisciplinaNombre { get; set; }
        public string DisciplinaNombre { get; set; }
        public string AreaNombre { get; set; }

        public string ClaseNombre { get; set; }
        public string RamaNombre { get; set; }
        public string SectorEconomicoNombre { get; set; }

        public string Nivel2Nombre { get; set; }
        public string OrganizacionNombre { get; set; }
        public string SectorNombre { get; set; }

        public string InstitucionNombre { get; set; }
        public bool InstitucionTipoInstitucionNombre { get; set; }
        public string InstitucionPaisNombre { get; set; }
        public string InstitucionEstadoPaisNombre { get; set; }
        public string InstitucionCiudad { get; set; }

        public string ProyectoNombre { get; set; }

        public string PalabraClave1 { get; set; }
        public string PalabraClave2 { get; set; }
        public string PalabraClave3 { get; set; }

        public string FechaAceptacion { get; set; }
        public string FechaPublicacion { get; set; }
        public int EstadoProducto { get; set; }

        public CustomSelectForm[] EstadosProductos { get; set; }

        public int Nivel2Id { get; set; }
        public int SubdisciplinaId { get; set; }
        public int ClaseId { get; set; }
        public int AreaTematicaId { get; set; }
        public int InstitucionId { get; set; }
        public int RevistaPublicacionId { get; set; }
        public int ProyectoId { get; set; }

        public int ModelId { get; set; }
        public bool IsShowForm { get; set; }
        public string InstitucionLabel { get; set; }
        public string RevistaLabel { get; set; }

        public string DireccionRegionalNombre { get; set; }

        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
        public SectorForm[] Sectores { get; set; }
        public OrganizacionForm[] Organizaciones { get; set; }
        public NivelForm[] Niveles { get; set; }
        public SectorForm[] SectoresEconomicos { get; set; }
        public RamaForm[] Ramas { get; set; }
        public ClaseForm[] Clases { get; set; }

        public string UrlAction { get; set; }
        public string Rel { get; set; }

        public CoautorInternoProductoForm[] CoautoresInternos { get; set; }
        public CoautorExternoProductoForm[] CoautoresExternos { get; set; }
        public string CheckboxName { get; set; }
        public bool CheckboxValue { get; set; }
        public string SubFormName { get; set; }
        public string UrlActionExterno { get; set; }
        public string UrlActionInterno { get; set; }
        public string Link1Id { get; set; }
        public string Link2Id { get; set; }
        public string InvestigadorType { get; set; }
    }
}