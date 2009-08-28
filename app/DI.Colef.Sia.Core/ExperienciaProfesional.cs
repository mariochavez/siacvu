using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class ExperienciaProfesional : Entity, IBaseEntity
    {
        public virtual string Entidad { get; set; }

        public virtual Organizacion Organizacion { get; set; }

        public virtual Nivel Nivel2 { get; set; }

        public virtual Nivel Nivel3 { get; set; }

        public virtual Nivel Nivel4 { get; set; }

        public virtual Nivel Nivel5 { get; set; }

        public virtual Nivel Nivel6 { get; set; }

        [NotNullNotEmpty]
        public virtual string Nombramiento { get; set; }

        public virtual DateTime FechaInicial { get; set; }

        public virtual DateTime FechaFinal { get; set; }

        public virtual Pais Pais { get; set; }

        public virtual Area Area { get; set; }

        public virtual Disciplina Disciplina { get; set; }

        public virtual Subdisciplina Subdisciplina { get; set; }

        public virtual Sector Sector { get; set; }

        public virtual Rama Rama { get; set; }

        public virtual Clase Clase { get; set; }

        public virtual string LineasInvestigacion { get; set; }

        public virtual long PrincipalesLogros { get; set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}
