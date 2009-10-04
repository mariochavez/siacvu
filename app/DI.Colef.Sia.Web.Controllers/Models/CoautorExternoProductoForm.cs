namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class CoautorExternoProductoForm
    {
        public int Id { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public int InvestigadorExternoId { get; set; }
        public string InvestigadorExternoNombre { get; set; }

        public int InstitucionId { get; set; }
        public string InstitucionNombre { get; set; }

        public int Posicion { get; set; }

        public static int CoautoresExternos { get; set; }
    }
}