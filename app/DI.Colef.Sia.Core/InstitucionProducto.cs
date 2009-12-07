using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class InstitucionProducto : Entity, IBaseEntity
    {

        [NotNull]
        public virtual Institucion Institucion { get; set; }

        public virtual int TipoProducto { get; set; }

        public virtual Usuario CreadoPor { get; set; }

        public virtual DateTime CreadoEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }

    public class InstitucionReporte : InstitucionProducto
    {

    }

    public class InstitucionEvento :InstitucionProducto
    {
        
    }
}