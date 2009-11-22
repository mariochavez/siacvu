namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ClaseForm
    {		
		public int Id { get; set; }
		public string Nombre { get; set; }
		public bool Activo { get; set; }
		public string Modificacion { get; set; }

        public int Rama { get; set; }
        public int RamaId { get; set; }

        public RamaForm[] Ramas { get; set; }

        public string RamaNombre { get; set; }

        public string RamaSectorNombre { get; set; }
    }
}
