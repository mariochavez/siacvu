namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ParticipanteForm
    {
        public int Id { get; set; }
        public string Controller { get; set; }
        public string IdName { get; set; }

        public ParticipanteInternoProductoForm[] ParticipantesInternos { get; set; }
        public ParticipanteExternoProductoForm[] ParticipantesExternos { get; set; }
        public int ModelId { get; set; }
        public int InvestigadorExternoId { get; set; }
        public int InvestigadorId { get; set; }

        public InvestigadorExternoForm InvestigadorExterno { get; set; }

        public bool ParticipanteSeOrdenaAlfabeticamente { get; set; }
    }
}