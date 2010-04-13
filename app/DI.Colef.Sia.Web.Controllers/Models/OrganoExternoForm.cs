using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class OrganoExternoForm : BaseForm
    {
        public string Nombre { get; set; }
        public string Siglas { get; set; }
        public string Participacion { get; set; }
        public string FechaInicial { get; set; }
        public string FechaFinal { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }
        public string DepartamentoNombre { get; set; }
        public string SedeNombre { get; set; }
        public string Ciudad { get; set; }

        public int ComprobanteOrganoExternoId { get; set; }
        public string ComprobanteOrganoExternoNombre { get; set; }

        public int FirmaAceptacion2 { get; set; }
        public string FirmaDescripcion { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }
        public string PaisNombre { get; set; }

        public int TipoOrgano { get; set; }
        public int TipoOrganoId { get; set; }
        public string TipoOrganoNombre { get; set; }

        public int Sector { get; set; }
        public int SectorId { get; set; }
        public string SectorNombre { get; set; }

        public int Ambito { get; set; }
        public int AmbitoId { get; set; }
        public string AmbitoNombre { get; set; }

        public ArchivoForm[] ArchivosOrganoExterno { get; set; }

        public override ArchivoForm[] Archivos
        {
            get { return ArchivosOrganoExterno; }
        }

        /* Catalogos */
        public TipoOrganoForm[] TiposOrganos { get; set; }
        public SectorForm[] Sectores { get; set; }
        public AmbitoForm[] Ambitos { get; set; }
        public PaisForm[] Paises { get; set; }
    }
}