using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class ResponsableExternoProducto : Entity, IBaseEntity
    {
        [NotNull]
        public virtual InvestigadorExterno InvestigadorExterno { get; set; }

        [NotNull]
        public virtual FormaParticipacion FormaParticipacion { get; set; }

        public virtual int TipoProducto { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }

    public class ResponsableExternoCapitulo : ResponsableExternoProducto
    {

    }
}