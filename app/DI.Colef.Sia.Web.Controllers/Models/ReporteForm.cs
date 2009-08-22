using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ReporteForm
    {
        public int Id { get; set; }

        public string Titulo { get; set; }
        public string Editorial { get; set; }
        public int NoPaginas { get; set; }
        public string Descripcion { get; set; }
        public string Objetivo { get; set; }
        public string PalabarasClave { get; set; }

        public string Fecha { get; set; }
        public string FechaEdicion { get; set; }
        public string FechaAceptacion { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        //Espacio para Agregar Mapeos
        public int TipoReporte { get; set; }
        public int TipoReporteId { get; set; }

        public int EstadoProducto { get; set; }
        public int EstadoProductoId { get; set; }

        public int PeriodoReferenciaId { get; set; }

        public int Proyecto { get; set; }
        public int ProyectoId { get; set; }

        public int LineaTematica { get; set; }
        public int LineaTematicaId { get; set; }

        public int Institucion { get; set; }
        public int InstitucionId { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }

        public int Investigador { get; set; }


        /* New */
        public CoautorExternoReporteForm[] CoautorExternoReportes { get; set; }
        public CoautorInternoReporteForm[] CoautorInternoReportes { get; set; }

        public CoautorExternoReporteForm CoautorExternoReporte { get; set; }
        public CoautorInternoReporteForm CoautorInternoReporte { get; set; }

        /* Catalogos */
        public TipoReporteForm[] TiposReportes { get; set; }
        public EstadoProductoForm[] EstadosProductos { get; set; }
        public PeriodoReferenciaForm PeriodoReferencia { get; set; }
        public ProyectoForm[] Proyectos { get; set; }
        public LineaTematicaForm[] LineasTematicas { get; set; }
        public InvestigadorExternoForm[] CoautoresExternos { get; set; }
        public InvestigadorForm[] CoautoresInternos { get; set; }
        public InstitucionForm[] Instituciones { get; set; }
        public PaisForm[] Paises { get; set; }
    }
}
