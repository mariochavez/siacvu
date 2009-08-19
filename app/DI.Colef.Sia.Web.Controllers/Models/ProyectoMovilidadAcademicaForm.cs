namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ProyectoMovilidadAcademicaForm
    {
        public int Id { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        //Espacio para Agregar Mapeos
        public int ProyectoId { get; set; }
        public string ProyectoNombre { get; set; }
    }
}
