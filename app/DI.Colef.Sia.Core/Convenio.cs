using System;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class Convenio : Entity
    {
		public virtual string Nombre { get; set; }

        public virtual DateTime FechaFirma { get; set; }

        public virtual DateTime FechaConclusion { get; set; }

        public virtual string TerminoReferencia { get; set; }

        public virtual string ProductoComprometido { get; set; }

    }
}
