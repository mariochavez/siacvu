using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class DistincionForm
    {
        public int Id { get; set; }
        public string Descripcion { get; set; }
        public string FechaOtorgamiento { get; set; }
        public string Ciudad { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        //Espacio para Agregar Mapeos
        public int TipoDistincion { get; set; }
        public int TipoDistincionId { get; set; }

        public string InstitucionNombre { get; set; }
        public int InstitucionId { get; set; }

        public int Ambito { get; set; }
        public int AmbitoId { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }

        public int EstadoPais { get; set; }
        public int EstadoPaisId { get; set; }

        public int Investigador { get; set; }
        public string PeriodoReferenciaPeriodo { get; set; }

        /* Catalogos */
        public TipoDistincionForm[] TiposDistinciones { get; set; }
        public AmbitoForm[] Ambitos { get; set; }
        public PaisForm[] Paises { get; set; }
        public EstadoPaisForm[] EstadosPaises { get; set; }
    }
}
