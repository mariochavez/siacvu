namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ParticipacionMedioForm
    {
		public int Id { get; set; }
        public string Titulo { get; set; }
        public string Institucion { get; set; }
        public string LugarPresentacion { get; set; }
        public string FechaPresentacion { get; set; }
        public string PalabraClave1 { get; set; }
        public string PalabraClave2 { get; set; }
        public string PalabraClave3 { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }

        public int FirmaAceptacion2 { get; set; }
        public string FirmaDescripcion { get; set; }

        public int AreaTematicaId { get; set; }
        public string AreaTematicaNombre { get; set; }

        public int DirigidoA { get; set; }
        public int DirigidoAId { get; set; }
        public string DirigidoANombre { get; set; }

        public int TipoParticipacion { get; set; }
        public int TipoParticipacionId { get; set; }
        public string TipoParticipacionNombre { get; set; }

        public int Ambito { get; set; }
        public int AmbitoId { get; set; }
        public string AmbitoNombre { get; set; }

        public string UsuarioNombre { get; set; }
        public string UsuarioApellidoPaterno { get; set; }
        public string UsuarioApellidoMaterno { get; set; }

        public string InvestigadorNombre
        {
            get
            {
                return string.Format("{0} {1} {2}", UsuarioApellidoPaterno, UsuarioApellidoMaterno, UsuarioNombre);
            }
        }

        /* Catalogos */
		public AmbitoForm[] Ambitos { get; set; }
        public DirigidoAForm[] DirigidosA { get; set; }
        public TipoParticipacionForm[] TiposParticipaciones { get; set; }

        /*Show*/
        public ShowFieldsForm ShowFields { get; set; }
        public AreaTematicaForm AreaTematica { get; set; }
    }
}