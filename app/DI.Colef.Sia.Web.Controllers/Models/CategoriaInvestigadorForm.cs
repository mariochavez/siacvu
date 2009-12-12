using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class CategoriaInvestigadorForm
    {
        public int Id { get; set; }
        public string FechaInicial { get; set; }
        public string FechaFinal { get; set; }
        public string CategoriaNombre { get; set; }
        public int Categoria { get; set; }

        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public string ComprobanteNombre { get; set; }

        public int ComprobanteId { get; set; }
    }
}