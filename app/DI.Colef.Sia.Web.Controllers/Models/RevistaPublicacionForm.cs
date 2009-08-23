namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class RevistaPublicacionForm
    {
        public int Id { get; set; }
        public string Titulo { get; set; }
        public string Periodicidad { get; set; }
        public string Issn { get; set; }
        public string Detalle { get; set; }
        public string Tipo { get; set; }
        public string Estado { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public int Institucion { get; set; }
        public int InstitucionId { get; set; }

        public InstitucionForm[] Instituciones { get; set; }
    }
}
