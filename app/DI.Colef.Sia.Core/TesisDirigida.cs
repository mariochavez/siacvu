using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [HasUniqueDomainSignature]
    [TesisDirigidaValidator]
    public class TesisDirigida : Entity, IBaseEntity
    {
        [DomainSignature]
		[NotNullNotEmpty]
		public virtual string Titulo { get; set; }

		public virtual DateTime FechaConclusion { get; set; }

		//public virtual string Autor { get; set; }

        public virtual string NombreAlumno { get; set; }

		public virtual DateTime FechaGrado { get; set; }

        public virtual int Puntuacion { get; set; }

		public virtual GradoAcademico GradoAcademico { get; set; }

		public virtual Pais Pais { get; set; }

		public virtual FormaParticipacion FormaParticipacion { get; set; }

		public virtual Institucion Institucion { get; set; }

		public virtual ProgramaEstudio ProgramaEstudio { get; set; }

		public virtual LineaTematica LineaTematica { get; set; }

		public virtual PeriodoReferencia PeriodoReferencia { get; set; }

		public virtual Sector Sector { get; set; }

		public virtual Dependencia Dependencia { get; set; }

		public virtual Departamento Departamento { get; set; }

		public virtual Area Area { get; set; }

		public virtual Disciplina Disciplina { get; set; }

		public virtual Subdisciplina Subdisciplina { get; set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual Departamento DepartamentoInvestigador { get; set; }

        public virtual Sede Sede { get; set; }

		public virtual Usuario CreadorPor { get; set; }

		public virtual DateTime CreadorEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}
