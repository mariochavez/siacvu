using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class FirmaForm
    {
		public int Id { get; set; }
		public int TipoProducto { get; set; }
		public int Producto { get; set; }
        public int Aceptacion1 { get; set; }
        public int Aceptacion2 { get; set; }
        public int Aceptacion3 { get; set; }

        public string Firma1 { get; set; }
        public string Firma2 { get; set; }
        public string Firma3 { get; set; }

        public int Usuario1 { get; set; }
        public int Usuario2 { get; set; }
        public int Usuario3 { get; set; }

		public bool Activo { get; set; }
		public string Modificacion { get; set; }

        public string Controller { get; set; }
        public string IdName { get; set; }
        public string Descripcion { get; set; }
        public int ProductoId { get; set; }

        public int PuntuacionSieva { get; set; }
    }
}
