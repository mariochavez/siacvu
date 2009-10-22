using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [HasUniqueDomainSignature]
    [ParticipacionAcademiaValidator]
    public class ParticipacionAcademia : Entity, IBaseEntity
    {
        [NotNullNotEmpty]
        [DomainSignature]
        public virtual string NombreProducto { get; set; }

        public virtual string Revista { get; set; }

        public virtual string Volumen { get; set; }

        public virtual int NoVolumen { get; set; }

        public virtual Institucion Institucion { get; set; }

        public virtual string Editorial { get; set; }

        public virtual Pais Pais { get; set; }

        public virtual int EstadoProducto { get; set; }

        public virtual DateTime FechaAceptacion { get; set; }

        public virtual Proyecto Proyecto { get; set; }

        public virtual DateTime FechaEdicion { get; set; }

        public virtual LineaTematica LineaTematica { get; set; }

        public virtual Usuario Usuario { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}
