using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [TesisDirigidaValidator]
    public class TesisDirigida : Entity, IBaseEntity
    {
        const int tipoProducto = 13; // 13 Representa Tesis Dirigida

        public virtual int TipoProducto { get { return tipoProducto; } }

        [Valid]
        public virtual Archivo ComprobanteTesisDirigida { get; set; }

        [Valid]
        public virtual Firma Firma { get; set; }

        public virtual int TipoTesis { get; set; }

        public virtual TesisPosgrado TesisPosgrado { get; set; }

		public virtual string Titulo { get; set; }

        public virtual string ProgramaEstudio { get; set; }

        public virtual DateTime FechaGrado { get; set; }

        public virtual VinculacionAPyD VinculacionAPyD { get; set; }

        public virtual int FormaParticipacion { get; set; }

        public virtual string NombreAlumno { get; set; }

        public virtual GradoAcademico GradoAcademico { get; set; }

        public virtual Institucion Institucion { get; set; }

        public virtual decimal Puntuacion { get; set; }

        public virtual Sector Sector { get; set; }

        public virtual Organizacion Organizacion { get; set; }

		public virtual Nivel Nivel2 { get; set; }

        public virtual Area Area { get; set; }

        public virtual Disciplina Disciplina { get; set; }

		public virtual Subdisciplina Subdisciplina { get; set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual Departamento Departamento { get; set; }

        public virtual Sede Sede { get; set; }

		public virtual Usuario CreadoPor { get; set; }

		public virtual DateTime CreadoEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}