using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ArticuloForm
    {
        public int Id { get; set; }
        public string FechaAceptacion { get; set; }
        public string Titulo { get; set; }
        public string Volumen { get; set; }
        public int Numero { get; set; }
        public int PaginaInicial { get; set; }
        public int PaginaFinal { get; set; }
        public string FechaEdicion { get; set; }
        public int Participantes { get; set; }
        public string PalabrasClaves { get; set; }
        public int Puntuacion { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public int TipoArticulo { get; set; }
        public int TipoArticuloId { get; set; }

        public int Idioma { get; set; }
        public int IdiomaId { get; set; }

        public int EstadoProducto { get; set; }
        public int EstadoProductoId { get; set; }

        public int PeriodoReferencia { get; set; }
        public int PeriodoReferenciaId { get; set; }

        public int LineaTematica { get; set; }
        public int LineaTematicaId { get; set; }

        public int Proyecto { get; set; }
        public int ProyectoId { get; set; }


        public int Pais { get; set; }
        public int PaisId { get; set; }

        public int RevistaPublicacion { get; set; }
        public int RevistaPublicacionId { get; set; }

        public int Institucion { get; set; }
        public int InstitucionId { get; set; }

        public int Indice1 { get; set; }
        public int Indice1Id { get; set; }

        public int Indice2 { get; set; }
        public int Indice2Id { get; set; }

        public int Indice3 { get; set; }
        public int Indice3Id { get; set; }

        public int LineaInvestigacion { get; set; }
        public int LineaInvestigacionId { get; set; }

        public int TipoActividad { get; set; }
        public int TipoActividadId { get; set; }

        public int TipoParticipante { get; set; }
        public int TipoParticipanteId { get; set; }

        public int Area { get; set; }
        public int AreaId { get; set; }

        public int Disciplina { get; set; }
        public int DisciplinaId { get; set; }

        public int Subdisciplina { get; set; }
        public int SubdisciplinaId { get; set; }

        public int Investigador { get; set; }

        public CoautorExternoArticuloForm[] CoautorExternoArticulos { get; set; }
        public CoautorInternoArticuloForm[] CoautorInternoArticulos { get; set; }

        /* New */
        public CoautorExternoArticuloForm CoautorExternoArticulo { get; set; }
        public CoautorInternoArticuloForm CoautorInternoArticulo { get; set; }

        /* Catalogos */
        public TipoArticuloForm[] TiposArticulos { get; set; }
        public IdiomaForm[] Idiomas { get; set; }
        public EstadoProductoForm[] EstadosProductos { get; set; }
        public PeriodoReferenciaForm[] PeriodosReferencias { get; set; }
        public LineaTematicaForm[] LineasTematicas { get; set; }
        public PaisForm[] Paises { get; set; }
        public RevistaPublicacionForm[] RevistasPublicaciones { get; set; }
        public InstitucionForm[] Instituciones { get; set; }
        public IndiceForm[] Indices1 { get; set; }
        public IndiceForm[] Indices2 { get; set; }
        public IndiceForm[] Indices3 { get; set; }
        public InvestigadorExternoForm[] CoautoresExternos { get; set; }
        public InvestigadorForm[] CoautoresInternos { get; set; }
        public LineaInvestigacionForm[] LineasInvestigaciones { get; set; }
        public TipoActividadForm[] TiposActividades { get; set; }
        public TipoParticipanteForm[] TiposParticipantes { get; set; }
        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
        public ProyectoForm[] Proyectos { get; set; }
    }
}
