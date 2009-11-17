namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class EstanciaInstitucionExternaForm
    {
        public int Id { get; set; }
        public string FechaInicial { get; set; }
        public string FechaFinal { get; set; }
        public string Actividades { get; set; }
        public string Logros { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }

        //Espacio para Agregar Mapeos
        public int TipoEstancia { get; set; }
        public int TipoEstanciaId { get; set; }
        public string TipoEstanciaNombre { get; set; }

        public int Nivel2 { get; set; }
        public int Nivel2Id { get; set; }
        public string Nivel2Nombre { get; set; }
        
        public int InstitucionId { get; set; }
        public string InstitucionNombre { get; set; }

        /* Catalogos */
        public TipoEstanciaForm[] TiposEstancias { get; set; }
        public NivelForm[] Niveles2 { get; set; }
    }
}