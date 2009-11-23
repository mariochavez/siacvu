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

		//public int Nivel2 { get; set; }
		public int Nivel2Id { get; set; }
        public string Nivel2Nombre { get; set; }
		
		/* Catalogos */
        public NivelForm[] Niveles2 { get; set; }

        /*Show*/
        public ShowFieldsForm ShowFields { get; set; }
        public NivelForm Nivel2 { get; set; }
    }
}
