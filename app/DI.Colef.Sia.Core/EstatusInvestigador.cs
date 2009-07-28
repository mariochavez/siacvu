using System;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class EstatusInvestigador : Entity, IBaseEntity
    {
        public DateTime Fecha { get; set; }

        public virtual Estado Estado { get; set; }

        public virtual string CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual string ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}