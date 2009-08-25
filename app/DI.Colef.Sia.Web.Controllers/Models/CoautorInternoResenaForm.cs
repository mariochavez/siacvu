namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class CoautorInternoResenaForm
    {
        public int Id { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        //Espacio para Agregar Mapeos
        public int InvestigadorId { get; set; }
        public string InvestigadorUsuarioPersonaNombre { get; set; }
        public string InvestigadorUsuarioPersonaApellidoPaterno { get; set; }
        public string InvestigadorUsuarioPersonaApellidoMaterno { get; set; }

        public string NombreCoautor
        {
            get
            {
                return string.Format("{0} {1} {2}", InvestigadorUsuarioPersonaApellidoPaterno,
                                     InvestigadorUsuarioPersonaApellidoMaterno, InvestigadorUsuarioPersonaNombre);
            }
        }
    }
}
