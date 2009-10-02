using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class CoautorInternoProducto : Entity, IBaseEntity
    {
        [NotNull]
        public virtual Investigador Investigador { get; set; }

        [Min(1)]
        public virtual int Posicion { get; set; }

        public virtual int TipoProducto { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }

    
    public class CoautorInternoArticulo : CoautorInternoProducto
    {
        
    }
}
