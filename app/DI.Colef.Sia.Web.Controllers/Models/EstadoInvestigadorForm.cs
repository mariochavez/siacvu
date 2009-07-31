namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class EstadoInvestigadorForm
    {
        public int Id { get; set; }
        public string Fecha { get; set; }
        public string EstadoNombre { get; set; }
        public int Estado { get; set; }

        public bool Activo { get; set; }
        public string Modificacion { get; set; }
    }
}