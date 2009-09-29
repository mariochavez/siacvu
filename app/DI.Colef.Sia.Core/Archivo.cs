using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [HasUniqueDomainSignature]
    public class Archivo : Entity, IBaseEntity
    {
        [DomainSignature]
        [NotNullNotEmpty]
        [Length(50)]
        public virtual string Nombre { get; set; }

        public virtual TipoArchivo TipoArchivo { get; set; }

        public virtual int TipoProducto { get; set; }

        public virtual int Producto { get; set; }

        public virtual byte[] Datos { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}