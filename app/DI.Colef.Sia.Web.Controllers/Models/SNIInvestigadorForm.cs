namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class SNIInvestigadorForm
    {
        public int Id { get; set; }

        public string Fecha { get; set; }

        public string SNINombre { get; set; }
        public int SNI { get; set; }

        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public string ExpedienteSNI { get; set; }
    }
}
