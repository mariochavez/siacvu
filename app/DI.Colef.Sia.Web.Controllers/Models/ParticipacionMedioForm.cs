using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ParticipacionMedioForm
    {
		public int Id { get; set; }
		public string Titulo { get; set; }
		public string Nombre { get; set; }
		public int MedioImpreso { get; set; }
		public int MedioElectronico { get; set; }
		public string Especificacion { get; set; }
		public int Genero { get; set; }
		public string Tema { get; set; }
		public int PeriodoReferencia { get; set; }
		public int Proyecto { get; set; }
		public int LineaTematica { get; set; }
		public int Ambito { get; set; }
		public string FechaDifusion { get; set; }
		public int Pais { get; set; }
		public int EstadoPais { get; set; }
		public string Ciudad { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }
		
		//Espacio para Agregar Mapeos
		
		
				
		/* New */
				
		/* Catalogos */
		public MedioImpresoForm[] MediosImpresos { get; set; }
		public MedioElectronicoForm[] MediosElectronicos { get; set; }
		public GeneroForm[] Generos { get; set; }
		public PeriodoReferenciaForm[] PeriodosReferencias { get; set; }
		public ProyectoForm[] Proyectos { get; set; }
		public LineaTematicaForm[] LineasTematicas { get; set; }
		public AmbitoForm[] Ambitos { get; set; }
		public PaisForm[] Paises { get; set; }
		public EstadoPaisForm[] EstadosPaises { get; set; }
	
		
		    }
}
