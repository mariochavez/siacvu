namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class TipoParticipacionEventoForm
    {
        public int Id { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        //Espacio para Agregar Mapeos
        public int TipoParticipacion { get; set; }
        public string TipoParticipacionNombre { get; set; }
    }
}
