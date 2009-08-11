using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using System.Collections.Generic;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [HasUniqueDomainSignature]
    //[CapituloValidator]
	public class Capitulo : Entity, IBaseEntity
    {
		public Capitulo()
		{
			CoautorExternoCapitulos = new List<CoautorExternoCapitulo>();
            CoautorInternoCapitulos = new List<CoautorInternoCapitulo>();
            ResponsableInternoCapitulos = new List<ResponsableInternoCapitulo>();
            ResponsableExternoCapitulos = new List<ResponsableExternoCapitulo>();
		}
		
		public virtual void AddCoautorExterno(CoautorExternoCapitulo coautorExternoCapitulo)
        {
            CoautorExternoCapitulos.Add(coautorExternoCapitulo);
        }
        public virtual void AddCoautorInterno(CoautorInternoCapitulo coautorInternoCapitulo)
        {
            CoautorInternoCapitulos.Add(coautorInternoCapitulo);
        }
        public virtual void AddResponsableInterno(ResponsableInternoCapitulo responsableInternoCapitulo)
        {
            ResponsableInternoCapitulos.Add(responsableInternoCapitulo);
        }
        public virtual void AddResponsableExterno(ResponsableExternoCapitulo responsableExternoCapitulo)
        {
            ResponsableExternoCapitulos.Add(responsableExternoCapitulo);
        }

        [NotNull]
        public virtual Investigador Investigador { get; set; }

        [NotNull]
		public virtual TipoCapitulo TipoCapitulo { get; set; }

        [DomainSignature]
		[NotNullNotEmpty]
		public virtual string NombreCapitulo { get; set; }

		[NotEmptyDate]
		public virtual DateTime FechaAceptacion { get; set; }

		[NotEmptyDate]
		public virtual DateTime FechaEdicion { get; set; }

        [NotNull]
        public virtual EstadoProducto EstadoProducto { get; set; }

        [NotNull]
		public virtual PeriodoReferencia PeriodoReferencia { get; set; }

        [NotNull]
		public virtual LineaTematica LineaTematica { get; set; }

        [NotNull]
		public virtual Idioma Idioma { get; set; }

        [Valid]
		public virtual IList<CoautorExternoCapitulo> CoautorExternoCapitulos { get; private set; }

        [Valid]
		public virtual IList<CoautorInternoCapitulo> CoautorInternoCapitulos { get; private set; }

		[NotNullNotEmpty]
		public virtual string NombreLibro { get; set; }

		[NotNullNotEmpty]
		public virtual string Editorial { get; set; }

        [NotNull]
		public virtual Pais Pais { get; set; }

        [NotNull]
		public virtual int NoPaginas { get; set; }

        [Valid]
		public virtual IList<ResponsableInternoCapitulo> ResponsableInternoCapitulos { get; private set; }

        [Valid]
		public virtual IList<ResponsableExternoCapitulo> ResponsableExternoCapitulos { get; private set; }

        [NotNull]
		public virtual FormaParticipacion FormaParticipacion { get; set; }

        public virtual int Puntuacion { get; set; }

		public virtual string Volumen { get; set; }
		
		public virtual string Editores { get; set; }
        
		public virtual TipoParticipacion TipoParticipacion { get; set; }
        
		public virtual TipoParticipante TipoParticipante { get; set; }
        
		public virtual Area Area { get; set; }
        
		public virtual Disciplina Disciplina { get; set; }
        
		public virtual Subdisciplina Subdisciplina { get; set; }
        
		public virtual string Traductor { get; set; }
        
		public virtual string NombreTraductor { get; set; }
		
		public virtual string Resumen { get; set; }

		public virtual Usuario CreadorPor { get; set; }

		public virtual DateTime CreadorEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}
