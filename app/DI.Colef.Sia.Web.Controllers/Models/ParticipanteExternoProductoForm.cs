namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ParticipanteExternoProductoForm
    {
        public int Id { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public int InvestigadorExternoId { get; set; }
        public string InvestigadorExternoNombre { get; set; }
        public string InvestigadorExternoApellidoPaterno { get; set; }
        public string InvestigadorExternoApellidoMaterno { get; set; }

        public string Nombre { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }

        public int InstitucionId { get; set; }
        public string InstitucionNombre { get; set; }

        public int ParentId { get; set; }

        public string NombreCompleto {
            get
            {
                return string.Format("{0} {1} {2}", InvestigadorExternoNombre, InvestigadorExternoApellidoPaterno,
                                     InvestigadorExternoApellidoMaterno);
            }
        }
    }
}