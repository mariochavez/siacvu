using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class CoautorExternoArticuloForm
    {
        public int Id { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public int InvestigadorExterno { get; set; }
        public string InvestigadorExternoNombre { get; set; }

        //Espacio para Agregar Mapeos


    }
}
