using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class CoautorInternoProducto : Entity, IBaseEntity
    {
        [NotNull]
        public virtual Investigador Investigador { get; set; }

        public virtual int Posicion { get; set; }

        public virtual int TipoProducto { get; set; }

        public virtual Usuario CreadoPor { get; set; }

        public virtual DateTime CreadoEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }

    public class CoautorInternoArticulo : CoautorInternoProducto
    {
        
    }

    public class CoautorInternoCapitulo : CoautorInternoProducto
    {
        
    }

    public class CoautorInternoEvento : CoautorInternoProducto
    {

    }

    public class CoautorInternoLibro : CoautorInternoProducto
    {
        
    }

    public class CoautorInternoReporte : CoautorInternoProducto
    {
        
    }

    public class CoautorInternoResena : CoautorInternoProducto
    {
        
    }

    public class CoautorInternoObraTraducida : CoautorInternoProducto
    {

    }
}
