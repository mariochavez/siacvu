namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ParticipacionMedioForm
    {
		public int Id { get; set; }
		public string Titulo { get; set; }
		public string Nombre { get; set; }
		public string Especificacion { get; set; }
		public string Tema { get; set; }
		public string FechaDifusion { get; set; }
        public string Ciudad { get; set; }
        public string NotaPeriodistica { get; set; }
        public string PalabraClave1 { get; set; }
        public string PalabraClave2 { get; set; }
        public string PalabraClave3 { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }

        public int MedioImpreso { get; set; }
        public int MedioImpresoId { get; set; }

        public int MedioElectronico { get; set; }
        public int MedioElectronicoId { get; set; }

        public int Genero { get; set; }
        public int GeneroId { get; set; }

        public int Proyecto { get; set; }
        public int ProyectoId { get; set; }

        public int LineaTematica { get; set; }
        public int LineaTematicaId { get; set; }

        public int Ambito { get; set; }
        public int AmbitoId { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }

        public int EstadoPais { get; set; }
        public int EstadoPaisId { get; set; }

        public int Investigador { get; set; }

		/* Catalogos */
        public PeriodoReferenciaForm PeriodoReferencia { get; set; }

		public MedioImpresoForm[] MediosImpresos { get; set; }
		public MedioElectronicoForm[] MediosElectronicos { get; set; }
		public GeneroForm[] Generos { get; set; }
        public ProyectoForm[] Proyectos { get; set; }
		public LineaTematicaForm[] LineasTematicas { get; set; }
		public AmbitoForm[] Ambitos { get; set; }
		public PaisForm[] Paises { get; set; }
		public EstadoPaisForm[] EstadosPaises { get; set; }
    }
}
