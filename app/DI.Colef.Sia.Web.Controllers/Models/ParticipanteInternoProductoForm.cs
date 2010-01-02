using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ParticipanteInternoProductoForm
    {
        public int Id { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public int InvestigadorId { get; set; }
        public string InvestigadorUsuarioNombre { get; set; }
        public string InvestigadorUsuarioApellidoPaterno { get; set; }
        public string InvestigadorUsuarioApellidoMaterno { get; set; }

        public int Posicion { get; set; }

        public int ParentId { get; set; }

        public string NombreParticipante
        {
            get
            {
                return string.Format("{0} {1} {2}", InvestigadorUsuarioApellidoPaterno,
                                     InvestigadorUsuarioApellidoMaterno, InvestigadorUsuarioNombre);
            }
        }

        public bool ParticipanteSeOrdenaAlfabeticamente { get; set; }
    }
}
