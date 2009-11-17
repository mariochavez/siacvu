namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class OrganoExternoForm
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Siglas { get; set; }
        public string Participacion { get; set; }
        public string FechaInicial { get; set; }
        public string FechaFinal { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }

        public int TipoOrgano { get; set; }
        public int TipoOrganoId { get; set; }
        public string TipoOrganoNombre { get; set; }

        public int Sector { get; set; }
        public int SectorId { get; set; }
        public string SectorNombre { get; set; }

        public int Ambito { get; set; }
        public int AmbitoId { get; set; }
        public string AmbitoNombre { get; set; }

        /* Catalogos */
        public TipoOrganoForm[] TiposOrganos { get; set; }
        public SectorForm[] Sectores { get; set; }
        public AmbitoForm[] Ambitos { get; set; }
    }
}