using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ProductoGeneradoProyectoForm
    {
        public int Id { get; set; }
        public string Modificacion { get; set; }
        public bool Activo { get; set; }

        public int ProductoGenerado { get; set; }
        public string FechaEntrega { get; set; }

        public int ParentId { get; set; }

        //public int GuidNumber { get; set; }
    }
}