namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ResenaForm
    {
        public int Id { get; set; }
        public string ReferenciaBibliograficaLibro { get; set; }
        public string ReferenciaBibliograficaRevista { get; set; }
        public string NombreProducto { get; set; }
        public int PaginaInicial { get; set; }
        public int PaginaFinal { get; set; }
        public string TituloLibro { get; set; }
        public string NombreRevista { get; set; }
        public string Editorial { get; set; }
        public string PalabraClave1 { get; set; }
        public string PalabraClave2 { get; set; }
        public string PalabraClave3 { get; set; }

        public string FechaAceptacion { get; set; }
        public string FechaEdicion { get; set; }

        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public int TipoResena { get; set; }
        public int TipoResenaId { get; set; }

        public int EstadoProducto { get; set; }
        public int EstadoProductoId { get; set; }

        public int Proyecto { get; set; }
        public int ProyectoId { get; set; }

        public int LineaTematicaId { get; set; }
        public string LineaTematicaNombre { get; set; }

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

        /* New */
        public CoautorExternoResenaForm[] CoautorExternoResenas { get; set; }
        public CoautorInternoResenaForm[] CoautorInternoResenas { get; set; }

        public CoautorExternoResenaForm CoautorExternoResena { get; set; }
        public CoautorInternoResenaForm CoautorInternoResena { get; set; }

        /* Catalogos */
        public TipoResenaForm[] TiposResenas { get; set; }
        public EstadoProductoForm[] EstadosProductos { get; set; }
        public ProyectoForm[] Proyectos { get; set; }
        public InvestigadorExternoForm[] CoautoresExternos { get; set; }
        public InvestigadorForm[] CoautoresInternos { get; set; }
        public PaisForm[] Paises { get; set; }
        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
    }
}
