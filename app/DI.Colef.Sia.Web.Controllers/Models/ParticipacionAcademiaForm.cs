namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ParticipacionAcademiaForm
    {
        public int Id { get; set; }
        public string NombreProducto { get; set; }
        public string Revista { get; set; }
        public string Volumen { get; set; }
        public int NoVolumen { get; set; }
        public string Editorial { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public string FechaAceptacion { get; set; }
        public string FechaEdicion { get; set; }

        //Espacio para Agregar Mapeos
        public int Pais { get; set; }
        public int PaisId { get; set; }
        public string PaisNombre { get; set; }

        public int EstadoProducto { get; set; }
        public int EstadoProductoId { get; set; }
        public string EstadoProductoNombre { get; set; }

        public int Proyecto { get; set; }
        public int ProyectoId { get; set; }
        public string ProyectoNombre { get; set; }

        public int InstitucionId { get; set; }
        public string InstitucionNombre { get; set; }

        public int LineaTematicaId { get; set; }
        public string LineaTematicaNombre { get; set; }

        /* Catalogos */
        public PaisForm[] Paises { get; set; }
        public EstadoProductoForm[] EstadosProductos { get; set; }
        public ProyectoForm[] Proyectos { get; set; }
    }
}
