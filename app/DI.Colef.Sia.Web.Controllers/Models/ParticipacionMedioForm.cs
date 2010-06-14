namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ParticipacionMedioForm : BaseForm
    {
        public string Titulo { get; set; }
        public string Institucion { get; set; }
        public string LugarPresentacion { get; set; }
        public string FechaPresentacion { get; set; }
        public string PalabraClave1 { get; set; }
        public string PalabraClave2 { get; set; }
        public string PalabraClave3 { get; set; }
        public string NotaPeriodistica { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }

        public int DirigidoA { get; set; }
        public int DirigidoAId { get; set; }
        public string DirigidoANombre { get; set; }

        public string OtroTipoParticipacion { get; set; }

        public int TipoParticipacion { get; set; }
        public int TipoParticipacionId { get; set; }
        public string TipoParticipacionNombre { get; set; }

        public int Ambito { get; set; }
        public int AmbitoId { get; set; }
        public string AmbitoNombre { get; set; }

        /* Catalogos */
		public AmbitoForm[] Ambitos { get; set; }
        public DirigidoAForm[] DirigidosA { get; set; }
        public TipoParticipacionForm[] TiposParticipaciones { get; set; }

        /*Show*/
        public ShowFieldsForm ShowFields { get; set; }
        public AreaTematicaForm AreaTematica { get; set; }
    }
}