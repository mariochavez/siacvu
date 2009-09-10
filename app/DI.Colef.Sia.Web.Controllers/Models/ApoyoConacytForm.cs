namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ApoyoConacytForm
    {
        public int Id { get; set; }
        public int NoApoyo { get; set; }
        public string FechaInicial { get; set; }
        public string FechaFinal { get; set; }
        public string PalabraClave1 { get; set; }
        public string PalabraClave2 { get; set; }
        public string PalabraClave3 { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        //Espacio para Agregar Mapeos
        public int TipoApoyo { get; set; }
        public int TipoApoyoId { get; set; }
        public string TipoApoyoNombre { get; set; }

        public int SubprogramaConacyt { get; set; }
        public int SubprogramaConacytId { get; set; }
        public string SubprogramaConacytNombre { get; set; }

        /* Catalogos */
        public TipoApoyoForm[] TiposApoyos { get; set; }
        public SubprogramaConacytForm[] SubprogramasConacyts { get; set; }
    }
}
