namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class TipoActividadMovilidadAcademicaForm
    {
        public int Id { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        //Espacio para Agregar Mapeos
        public int TipoActividadId { get; set; }
        public string TipoActividadNombre { get; set; }
    }
}
