using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;
using System.Collections.Generic;

namespace DecisionesInteligentes.Colef.Sia.Core
{
	//[HasUniqueDomainSignature]
    public class Libro : Entity, IBaseEntity
    {
		public Libro()
		{
			CoautorExternoLibros = new List<CoautorExternoLibro>();
            CoautorInternoLibros = new List<CoautorInternoLibro>();
		}
		
		public virtual void AddCoautorExterno(CoautorExternoLibro coautorExternoLibro)
        {
            CoautorExternoLibros.Add(coautorExternoLibro);
        }

        public virtual void AddCoautorInterno(CoautorInternoLibro coautorInternoLibro)
        {
            CoautorInternoLibros.Add(coautorInternoLibro);
        }

        [NotNull]
        public virtual Usuario Usuario { get; set; }
		
		public virtual TipoPublicacion TipoPublicacion { get; set; }

        public virtual RevistaPublicacion NombreRevista { get; set; }

        public virtual Institucion Institucion { get; set; }

        public virtual Evento NombreEvento { get; set; }

		public virtual EstadoProducto EstadoProducto { get; set; }

		public virtual PeriodoReferencia PeriodoReferencia { get; set; }

		public virtual bool TieneProyecto { get; set; }

		public virtual Proyecto Proyecto { get; set; }

		public virtual LineaTematica LineaTematica { get; set; }

		public virtual DateTime FechaAceptacion { get; set; }

		[DomainSignature]
		[NotNullNotEmpty]
		public virtual string Nombre { get; set; }

		public virtual string ISBN { get; set; }

		public virtual string Editorial { get; set; }

        public virtual string Volumen { get; set; }

        public virtual int Numero { get; set; }

        public virtual DateTime FechaEvento { get; set; }

		public virtual DateTime FechaEdicion { get; set; }

        public virtual Pais Pais { get; set; }

		public virtual int NoPaginas { get; set; }

		public virtual string Tiraje { get; set; }

		public virtual Idioma Idioma { get; set; }

		public virtual FormaParticipacion FormaParticipacion { get; set; }

        [Valid]
		public virtual IList<CoautorExternoLibro> CoautorExternoLibros { get; private set; }

        [Valid]
		public virtual IList<CoautorInternoLibro> CoautorInternoLibros { get; private set; }

		public virtual IdentificadorLibro IdentificadorLibro { get; set; }

        public virtual string PalabraClave1 { get; set; }

        public virtual string PalabraClave2 { get; set; }

        public virtual string PalabraClave3 { get; set; }

		public virtual bool Traductor { get; set; }

		public virtual Area Area { get; set; }

		public virtual Disciplina Disciplina { get; set; }

        public virtual int Puntuacion { get; set; }

		public virtual Subdisciplina Subdisciplina { get; set; }

		public virtual Usuario CreadorPor { get; set; }

		public virtual DateTime CreadorEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}