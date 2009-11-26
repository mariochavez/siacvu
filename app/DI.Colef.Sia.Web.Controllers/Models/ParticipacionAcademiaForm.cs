namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ParticipacionAcademiaForm
    {
        public int Id { get; set; }
        public string NombreProducto { get; set; }
        public string Revista { get; set; }
        public int Volumen { get; set; }
        public int EstadoProducto { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public string FechaAceptacion { get; set; }
        public string FechaPublicacion { get; set; }
        public string FechaEdicion { get; set; }

        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }

        //Espacio para Agregar Mapeos
        public int Pais { get; set; }
        public int PaisId { get; set; }
        public string PaisNombre { get; set; }

        public int Editorial { get; set; }
        public int EditorialId { get; set; }
        public string EditorialNombre { get; set; }

        public int ProyectoId { get; set; }
        public string ProyectoNombre { get; set; }

        public int RevistaPublicacionId { get; set; }
        public string RevistaPublicacionTitulo { get; set; }

        public int InstitucionId { get; set; }
        public string InstitucionNombre { get; set; }

        public int LineaTematicaId { get; set; }
        public string LineaTematicaNombre { get; set; }

        /* Catalogos */
        public PaisForm[] Paises { get; set; }
        public EditorialForm[] Editoriales { get; set; }
        public CustomSelectForm[] EstadosProductos { get; set; }
        public CustomSelectForm[] Volumenes { get; set; }
        public ProyectoForm[] Proyectos { get; set; }

        /*Show*/
        public ShowFieldsForm ShowFields { get; set; }
        public InstitucionForm Institucion { get; set; }
        public RevistaPublicacionForm RevistaPublicacion { get; set; }
        public ProyectoForm Proyecto { get; set; }
    }
}