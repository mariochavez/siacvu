using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [HasUniqueDomainSignature]
    [ExperienciaProfesionalValidator]
    public class ExperienciaProfesional : Entity, IBaseEntity
    {
        public virtual string Entidad { get; set; }

        public virtual Sector Sector { get; set; }

        public virtual Organizacion Organizacion { get; set; }

        public virtual Nivel Nivel2 { get; set; }

        [NotNullNotEmpty]
        [DomainSignature]
        public virtual string Nombramiento { get; set; }

        public virtual DateTime FechaInicial { get; set; }

        public virtual DateTime FechaFinal { get; set; }

        public virtual Pais Pais { get; set; }

        public virtual Area Area { get; set; }

        public virtual Disciplina Disciplina { get; set; }

        public virtual Subdisciplina Subdisciplina { get; set; }

        public virtual Sector SectorEconomico { get; set; }

        public virtual Rama Rama { get; set; }

        public virtual Clase Clase { get; set; }

        public virtual string LineaInvestigacion1 { get; set; }

        public virtual string LineaInvestigacion2 { get; set; }

        public virtual string LineaInvestigacion3 { get; set; }

        public virtual string PrincipalesLogros { get; set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}