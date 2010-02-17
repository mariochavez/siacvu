namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ReporteForm : BaseForm
    {
        public int Id { get; set; }
        public string Titulo { get; set; }
        public int NoPaginas { get; set; }
        public string Descripcion { get; set; }
        public string Objetivo { get; set; }
        public string PalabraClave1 { get; set; }
        public string PalabraClave2 { get; set; }
        public string PalabraClave3 { get; set; }
        public string FechaAceptacion { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }
        public string Numero { get; set; }
        public string FechaPublicacion { get; set; }
        public bool TieneProyecto { get; set; }
        public int TipoReporte { get; set; }
        public int EstadoProducto { get; set; }
        public bool CoautorSeOrdenaAlfabeticamente { get; set; }

        public int ComprobanteAceptadoId { get; set; }
        public string ComprobanteAceptadoNombre { get; set; }

        public int ComprobanteReporteId { get; set; }
        public string ComprobanteReporteNombre { get; set; }

        public int FirmaAceptacion2 { get; set; }
        public string FirmaDescripcion { get; set; }

        public int ProyectoId { get; set; }
        public string ProyectoNombre { get; set; }
        public string ProyectoPalabraClave1 { get; set; }
        public string ProyectoPalabraClave2 { get; set; }
        public string ProyectoPalabraClave3 { get; set; }

        public int InstitucionId { get; set; }
        public string InstitucionNombre { get; set; }

        public int AreaTematicaId { get; set; }
        public string AreaTematicaNombre { get; set; }

        public int TotalCoautores
        {
            get
            {
                return (CoautorExternoReportes == null ? 0 : CoautorExternoReportes.Length) +
                    (CoautorInternoReportes == null ? 0 : CoautorInternoReportes.Length) + 1;
            }
        }

        /* New */
        public CoautorExternoProductoForm[] CoautorExternoReportes { get; set; }
        public CoautorInternoProductoForm[] CoautorInternoReportes { get; set; }
        public InstitucionProductoForm[] InstitucionReportes { get; set; }

        public CoautorExternoProductoForm CoautorExternoProducto { get; set; }
        public CoautorInternoProductoForm CoautorInternoProducto { get; set; }
        public InstitucionProductoForm InstitucionProducto { get; set; }

        /* Show */
        public ShowFieldsForm ShowFields { get; set; }
        public ProyectoForm Proyecto { get; set; }
        public AreaTematicaForm AreaTematica { get; set; }
        public InstitucionForm Institucion { get; set; }

        /* Catalogos */
        public CustomSelectForm[] TiposReportes { get; set; }
        public CustomSelectForm[] EstadosProductos { get; set; }
        public ProyectoForm[] Proyectos { get; set; }
        public InvestigadorExternoForm[] CoautoresExternos { get; set; }
        public InvestigadorForm[] CoautoresInternos { get; set; }
    }
}
