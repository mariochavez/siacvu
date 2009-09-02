using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class OrganoExterno : Entity, IBaseEntity
    {

        [NotNullNotEmpty]
        public virtual string Nombre { get; set; }

        public virtual string Siglas { get; set; }

        public virtual TipoOrgano TipoOrgano { get; set; }

        public virtual TipoParticipacionOrgano TipoParticipacion { get; set; }

        public virtual Sector Sector { get; set; }

        public virtual Nivel Nivel { get; set; }

        public virtual Ambito Ambito { get; set; }

        public virtual DateTime FechaInicial { get; set; }

        public virtual DateTime FechaFinal { get; set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}
