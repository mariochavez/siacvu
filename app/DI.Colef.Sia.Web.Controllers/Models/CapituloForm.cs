namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class CapituloForm
    {
		public int Id { get; set; }
		public string NombreCapitulo { get; set; }
		public string FechaAceptacion { get; set; }
		public string FechaEdicion { get; set; }
		public string NombreLibro { get; set; }
		public string Editorial { get; set; }
		public int NoPaginas { get; set; }
		public string Volumen { get; set; }
		public string Editores { get; set; }
		public string Traductor { get; set; }
		public string NombreTraductor { get; set; }
		public string Resumen { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }

        public int TipoCapitulo { get; set; }
        public int Estado { get; set; }
        public int PeriodoReferencia { get; set; }
        public int LineaTematica { get; set; }
        public int Idioma { get; set; }
        public int Pais { get; set; }
        public int FormaParticipacion { get; set; }
        public int TipoParticipacion { get; set; }
        public int TipoParticipante { get; set; }
        public int Area { get; set; }
        public int Disciplina { get; set; }
        public int Subdisciplina { get; set; }
        public int Investigador { get; set; }
		
		/* New */
		public CoautorExternoCapituloForm CoautorExternoCapitulo { get; set; }
		public CoautorInternoCapituloForm CoautorInternoCapitulo { get; set; }
		public ResponsableInternoCapituloForm ResponsableInternoCapitulo { get; set; }
		public ResponsableExternoCapituloForm ResponsableExternoCapitulo { get; set; }
		
		/* Catalogos */
		public TipoCapituloForm[] TiposCapitulos { get; set; }
		public EstadoForm[] Estados { get; set; }
		public PeriodoReferenciaForm[] PeriodosReferencias { get; set; }
		public LineaTematicaForm[] LineasTematicas { get; set; }
		public IdiomaForm[] Idiomas { get; set; }
		public InvestigadorExternoForm[] CoautoresExternos { get; set; }
        public InvestigadorForm[] CoautoresInternos { get; set; }
		public PaisForm[] Paises { get; set; }
        public InvestigadorForm[] ResponsablesInternos { get; set; }
        public InvestigadorExternoForm[] ResponsablesExternos { get; set; }
		public FormaParticipacionForm[] FormasParticipaciones { get; set; }
		public TipoParticipacionForm[] TiposParticipaciones { get; set; }
		public TipoParticipanteForm[] TiposParticipantes { get; set; }
		public AreaForm[] Areas { get; set; }
		public DisciplinaForm[] Disciplinas { get; set; }
		public SubdisciplinaForm[] Subdisciplinas { get; set; }
    }
}