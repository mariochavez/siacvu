namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ProductoDerivadoMovilidadAcademicaForm
    {
        public int Id { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        //Espacio para Agregar Mapeos
        public int ProductoDerivado { get; set; }
        public string ProductoDerivadoNombre { get; set; }
    }
}
