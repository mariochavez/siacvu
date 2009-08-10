namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class CoautorInternoEventoForm
    {
        public int Id { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        //Espacio para Agregar Mapeos
        public int InvestigadorId { get; set; }
        public string InvestigadorUsuarioPersonaNombre { get; set; }
    }
}
