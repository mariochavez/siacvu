using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class Tesis : Entity, IBaseEntity
    {
		[NotNullNotEmpty]
		public virtual string Titulo { get; set; }

		[NotEmptyDate]
		public virtual DateTime FechaConclusion { get; set; }

		[NotNullNotEmpty]
		public virtual string Autor { get; set; }

		[NotEmptyDate]
		public virtual DateTime FechaGrado { get; set; }

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

		public virtual Usuario CreadorPor { get; set; }

		public virtual DateTime CreadorEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}
