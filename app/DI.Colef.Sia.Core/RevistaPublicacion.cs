using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [HasUniqueDomainSignature]
    [RevistaPublicacionValidator]
    public class RevistaPublicacion : Entity, IBaseEntity
    {
        [DomainSignature]
        [Length(150)]
        [NotNullNotEmpty]
        public virtual string Titulo { get; set; }

        public virtual Institucion Institucion { get; set; }

        public virtual string DepartamentoAcademico { get; set; }

        public virtual string Issn { get; set; }

        public virtual string Contacto { get; set; }

        public virtual string Email { get; set; }

        public virtual string PaginaWeb { get; set; }

        public virtual string Telefono { get; set; }

        public virtual int TipoRevista { get; set; }

        public virtual int ClasificacionSieva { get; set; }

        public virtual string DescripcionRevista { get; set; }

        public virtual string FactorImpacto { get; set; }

        public virtual int FormatoRevista { get; set; }
        
        public virtual int Periodicidad { get; set; }

        public virtual AreaInvestigacion AreaInvestigacion { get; set; }

        public virtual Pais Pais { get; set; }

        public virtual Indice Indice1 { get; set; }

        public virtual Indice Indice2 { get; set; }

        public virtual Indice Indice3 { get; set; }

        public virtual Indice Indice4 { get; set; }

        public virtual int  Puntuacion { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}