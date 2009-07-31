namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class GradoAcademicoInvestigadorForm
    {
        public int Id { get; set; }
        public string Fecha { get; set; }
        public string GradoAcademicoNombre { get; set; }
        public int GradoAcademico { get; set; }
        public string Descripcion { get; set; }
        public string AreaInvestigacion { get; set; }
        public string Detalle { get; set; }

        public bool Activo { get; set; }
        public string Modificacion { get; set; }
    }
}