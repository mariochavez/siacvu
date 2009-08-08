using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class Curso : Entity, IBaseEntity
    {
        [NotNull]
        public virtual Investigador Investigador { get; set; }

        [NotNull]
        public virtual int NumeroHoras { get; set; }

        [NotNull]
        public virtual PeriodoReferencia PeriodoReferencia { get; set; }
        
        [NotNull]
        public virtual ProgramaEstudio ProgramaEstudio { get; set; }
        
        [NotNull]
        public virtual Institucion Institucion { get; set; }
        
        [NotNull]
        public virtual Nivel Nivel { get; set; }

        public virtual Sector Sector { get; set; }

        public virtual Organizacion Organizacion { get; set; }

        public virtual Nivel Nivel2 { get; set; }

        public virtual Nivel Nivel3 { get; set; }

        public virtual Nivel Nivel4 { get; set; }

        public virtual Nivel Nivel5 { get; set; }

        public virtual Pais Pais { get; set; }

        public virtual Area Area { get; set; }

        public virtual Disciplina Disciplina { get; set; }

        public virtual Subdisciplina Subdisciplina { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}
