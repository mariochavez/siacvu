using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class DictamenForm
    {
		public int Id { get; set; }
		public string Nombre { get; set; }
		public int TipoDictamen { get; set; }
		public int TipoParticipacion { get; set; }
		public int Institucion { get; set; }
		public int PeriodoReferencia { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }
		
		//Espacio para Agregar Mapeos
		
		
				
		/* New */
				
		/* Catalogos */
		public TipoDictamenForm[] TiposDictamenes { get; set; }
		public TipoParticipacionForm[] TiposParticipaciones { get; set; }
		public InstitucionForm[] Instituciones { get; set; }
		public PeriodoReferenciaForm[] PeriodosReferencias { get; set; }
	
		
		    }
}
