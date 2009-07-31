namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class CargoInvestigadorForm
    {
        public int Id { get; set; }
        public string Fecha { get; set; }

        public string CargoNombre { get; set; }
        public int Cargo { get; set; }

        public string DepartamentoNombre { get; set; }
        public int Departamento { get; set; }

        public string SedeNombre { get; set; }
        public int Sede { get; set; }

        public bool Activo { get; set; }
        public string Modificacion { get; set; }
    }
}