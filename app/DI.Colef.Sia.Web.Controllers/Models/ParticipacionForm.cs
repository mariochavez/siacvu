using System;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ParticipacionForm
    {
		public int Id { get; set; }
		public string Titulo { get; set; }
		public Investigador Autor { get; set; }
		public int OtraParticipacion { get; set; }
		public int TipoPresentacion { get; set; }
		public string Institucion { get; set; }
		public string FechaPresentacion { get; set; }
		public int PeriodoReferencia { get; set; }
		public int Proyecto { get; set; }
		public string Lugar { get; set; }
		public int Pais { get; set; }
		public int EstadoPais { get; set; }
		public string Ciudad { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }
		
		//Espacio para Agregar Mapeos
		
		
				
		/* New */
				
		/* Catalogos */
		public InvestigadorForm[] Investigadores { get; set; }
		public OtraParticipacionForm[] OtrasParticipaciones { get; set; }
		public TipoPresentacionForm[] TiposPresentaciones { get; set; }
		public PeriodoReferenciaForm[] PeriodosReferencias { get; set; }
		public ProyectoForm[] Proyectos { get; set; }
		public PaisForm[] Paises { get; set; }
		public EstadoPaisForm[] EstadosPaises { get; set; }
	
		
		    }
}
