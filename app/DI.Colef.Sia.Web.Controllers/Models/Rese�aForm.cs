using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ReseñaForm
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
        public string PalabrasClave { get; set; }

        public string FechaAceptacion { get; set; }
        public string FechaEdicion { get; set; }

        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        //Espacio para Agregar Mapeos
        public int EstadoProducto { get; set; }
        public int EstadoProductoId { get; set; }

        public int PeriodoReferencia { get; set; }
        public int PeriodoReferenciaId { get; set; }

        public int Proyecto { get; set; }
        public int ProyectoId { get; set; }

        public int LineaTematica { get; set; }
        public int LineaTematicaId { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }

        public int Area { get; set; }
        public int AreaId { get; set; }

        public int Disciplina { get; set; }
        public int DisciplinaId { get; set; }

        public int Subdisciplina { get; set; }
        public int SubdisciplinaId { get; set; }

        public int Investigador { get; set; }

        /* New */
        public CoautorExternoReseñaForm[] CoautorExternoReseñas { get; set; }
        public CoautorInternoReseñaForm[] CoautorInternoReseñas { get; set; }

        public CoautorExternoReseñaForm CoautorExternoReseña { get; set; }
        public CoautorInternoReseñaForm CoautorInternoReseña { get; set; }

        /* Catalogos */
        public EstadoProductoForm[] EstadosProductos { get; set; }
        public PeriodoReferenciaForm[] PeriodosReferencias { get; set; }
        public ProyectoForm[] Proyectos { get; set; }
        public LineaTematicaForm[] LineasTematicas { get; set; }
        public InvestigadorExternoForm[] CoautoresExternos { get; set; }
        public InvestigadorForm[] CoautoresInternos { get; set; }
        public PaisForm[] Paises { get; set; }
        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
    }
}
