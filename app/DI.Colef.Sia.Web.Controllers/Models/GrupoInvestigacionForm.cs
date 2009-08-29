using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class GrupoInvestigacionForm
    {
		public int Id { get; set; }
		public string NombreGrupoInvestigacion { get; set; }
		public string FechaCreacion { get; set; }
        public bool Lider { get; set; }
        public string Nombre { get; set; }
        public string Miembros { get; set; }
        public string Impacto { get; set; }
        public string VinculacionSectorProductivo { get; set; }
        public string VinculacionSectorSocial { get; set; }
        public string Colaboracion { get; set; }
        public string Administracion { get; set; }
        public string ProgramaRegistrado { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }
		
		public int Sector { get; set; }
		public int SectorId { get; set; }

		public int Organizacion { get; set; }
		public int OrganizacionId { get; set; }

		public int Nivel2 { get; set; }
		public int Nivel2Id { get; set; }

		public int Nivel3 { get; set; }
		public int Nivel3Id { get; set; }

		public int Nivel4 { get; set; }
		public int Nivel4Id { get; set; }

		public int Nivel5 { get; set; }
		public int Nivel5Id { get; set; }

		public int Nivel6 { get; set; }
		public int Nivel6Id { get; set; }
		
		/* Catalogos */
		public SectorForm[] Sectores { get; set; }
		public OrganizacionForm[] Organizaciones { get; set; }
        public NivelForm[] Niveles2 { get; set; }
        public NivelForm[] Niveles3 { get; set; }
        public NivelForm[] Niveles4 { get; set; }
        public NivelForm[] Niveles5 { get; set; }
        public NivelForm[] Niveles6 { get; set; }
    }
}
