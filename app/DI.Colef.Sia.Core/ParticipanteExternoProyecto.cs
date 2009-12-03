using System;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class ParticipanteExternoProyecto : Entity, IBaseEntity
    {
        public virtual InvestigadorExterno InvestigadorExterno { get; set; }

        //public virtual Institucion Institucion { get; set; }

        public virtual Usuario CreadoPor { get; set; }

        public virtual DateTime CreadoEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}