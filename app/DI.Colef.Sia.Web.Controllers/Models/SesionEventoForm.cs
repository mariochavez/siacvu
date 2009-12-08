namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class SesionEventoForm
    {
        public int Id { get; set; }

        public string NombreSesion { get; set; }
        public string ObjetivoSesion { get; set; }
        public string Lugar { get; set; }
        public string FechaEvento { get; set; }

        public string AmbitoNombre { get; set; }
        public int Ambito { get; set; }

        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public ParticipanteExternoProductoForm[] ParticipanteExternoEventos { get; set; }
        public ParticipanteInternoProductoForm[] ParticipanteInternoEventos { get; set; }

        public ParticipanteExternoProductoForm ParticipanteExternoProducto { get; set; }
        public ParticipanteInternoProductoForm ParticipanteInternoProducto { get; set; }
    }
}