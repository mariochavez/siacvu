namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class RecursoFinancieroProyectoForm
    {
        public int Id { get; set; }
        public string Recurso { get; set; }
        public long Monto { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        //Espacio para Agregar Mapeos
        public int Institucion { get; set; }
        public int InstitucionId { get; set; }
        public string InstitucionNombre { get; set; }

        public int Moneda { get; set; }
        public int MonedaId { get; set; }
        public string MonedaNombre { get; set; }

    }
}