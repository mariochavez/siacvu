namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ParticipacionForm
    {
		public int Id { get; set; }
		public string Titulo { get; set; }
        public string FechaPresentacion { get; set; }
        public string Lugar { get; set; }
        public string Ciudad { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

		public int Autor { get; set; }
        public int AutorId { get; set; }
        public string AutorUsuarioNombre { get; set; }
        public string AutorUsuarioApellidoPaterno { get; set; }
        public string AutorUsuarioApellidoMaterno { get; set; }

        public string NombreAutor
        {
            get
            {
                return string.Format("{0} {1} {2}", AutorUsuarioApellidoPaterno,
                                     AutorUsuarioApellidoMaterno, AutorUsuarioNombre);
            }
        }

        public int OtraParticipacion { get; set; }
        public int OtraParticipacionId { get; set; }
        public string OtraParticipacionNombre { get; set; }

		public int TipoPresentacion { get; set; }
        public int TipoPresentacionId { get; set; }
        public string TipoPresentacionNombre { get; set; }

		public int Proyecto { get; set; }
        public int ProyectoId { get; set; }
        public string ProyectoNombre { get; set; }

		public int Pais { get; set; }
        public int PaisId { get; set; }
        public string PaisNombre { get; set; }

		public int EstadoPais { get; set; }
        public int EstadoPaisId { get; set; }
        public string EstadoPaisNombre { get; set; }

        public int InstitucionId { get; set; }
        public string InstitucionNombre { get; set; }

        public string PeriodoReferenciaPeriodo { get; set; }
				
		/* Catalogos */
        public OtraParticipacionForm[] OtrasParticipaciones { get; set; }
		public TipoPresentacionForm[] TiposPresentaciones { get; set; }
        public ProyectoForm[] Proyectos { get; set; }
		public PaisForm[] Paises { get; set; }
		public EstadoPaisForm[] EstadosPaises { get; set; }
        public InvestigadorForm[] Autores { get; set; }
    }
}