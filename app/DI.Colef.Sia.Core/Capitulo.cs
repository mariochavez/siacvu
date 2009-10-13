using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using System.Collections.Generic;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [HasUniqueDomainSignature]
    [CapituloValidator]
	public class Capitulo : Entity, IBaseEntity, IResponsable, ICoautor
    {
        const int tipoProducto = 2; // 2 Representa Capitulo

		public Capitulo()
		{
			CoautorExternoCapitulos = new List<CoautorExternoCapitulo>();
            CoautorInternoCapitulos = new List<CoautorInternoCapitulo>();
            ResponsableInternoCapitulos = new List<ResponsableInternoCapitulo>();
            ResponsableExternoCapitulos = new List<ResponsableExternoCapitulo>();
		}

        public virtual void AddCoautorExterno(CoautorExternoProducto coautorExterno)
        {
            coautorExterno.TipoProducto = tipoProducto;
            CoautorExternoCapitulos.Add((CoautorExternoCapitulo)coautorExterno);
        }

        public virtual void AddCoautorInterno(CoautorInternoProducto coautorInterno)
        {
            coautorInterno.TipoProducto = tipoProducto;
            CoautorInternoCapitulos.Add((CoautorInternoCapitulo)coautorInterno);
        }
        public virtual void AddResponsableInterno(ResponsableInternoProducto responsableInterno)
        {
            responsableInterno.TipoProducto = tipoProducto;
            ResponsableInternoCapitulos.Add((ResponsableInternoCapitulo)responsableInterno);
        }
        public virtual void AddResponsableExterno(ResponsableExternoProducto responsableExterno)
        {
            responsableExterno.TipoProducto = tipoProducto;
            ResponsableExternoCapitulos.Add((ResponsableExternoCapitulo)responsableExterno);
        }

        public virtual void DeleteCoautorInterno(CoautorInternoProducto coautorInterno)
        {
            CoautorInternoCapitulos.Remove((CoautorInternoCapitulo)coautorInterno);
        }

        public virtual void DeleteCoautorExterno(CoautorExternoProducto coautorExterno)
        {
            CoautorExternoCapitulos.Remove((CoautorExternoCapitulo)coautorExterno);
        }

        public virtual void DeleteResponsableInterno(ResponsableInternoProducto coautorInterno)
        {
            ResponsableInternoCapitulos.Remove((ResponsableInternoCapitulo)coautorInterno);
        }

        public virtual void DeleteResponsableExterno(ResponsableExternoProducto coautorExterno)
        {
            ResponsableExternoCapitulos.Remove((ResponsableExternoCapitulo)coautorExterno);
        }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual Departamento Departamento { get; set; }

        public virtual Sede Sede { get; set; }

		public virtual TipoCapitulo TipoCapitulo { get; set; }

        [DomainSignature]
		[NotNullNotEmpty]
		public virtual string NombreCapitulo { get; set; }

		public virtual DateTime FechaAceptacion { get; set; }

        public virtual DateTime FechaPublicacion { get; set; }

		public virtual DateTime FechaEdicion { get; set; }

        public virtual EstadoProducto EstadoProducto { get; set; }

		public virtual PeriodoReferencia PeriodoReferencia { get; set; }

		public virtual Idioma Idioma { get; set; }

        public virtual Institucion Institucion { get; set; }

        public virtual bool TieneProyecto { get; set; }

        [Min(1)]
        public virtual int PosicionAutor { get; set; }

        [Valid]
		public virtual IList<CoautorExternoCapitulo> CoautorExternoCapitulos { get; private set; }

        [Valid]
		public virtual IList<CoautorInternoCapitulo> CoautorInternoCapitulos { get; private set; }

		public virtual string NombreLibro { get; set; }

		public virtual string Editorial { get; set; }

		public virtual Pais Pais { get; set; }

		public virtual int NoPaginas { get; set; }

        [Valid]
		public virtual IList<ResponsableInternoCapitulo> ResponsableInternoCapitulos { get; private set; }

        [Valid]
		public virtual IList<ResponsableExternoCapitulo> ResponsableExternoCapitulos { get; private set; }

		public virtual FormaParticipacion FormaParticipacion { get; set; }

        public virtual int Puntuacion { get; set; }

		public virtual string Volumen { get; set; }
        
		public virtual TipoParticipacion TipoParticipacion { get; set; }
        
		public virtual TipoParticipante TipoParticipante { get; set; }
        
		public virtual Area Area { get; set; }
        
		public virtual Disciplina Disciplina { get; set; }
        
		public virtual Subdisciplina Subdisciplina { get; set; }

        public virtual Proyecto Proyecto { get; set; }
        
		public virtual bool Traductor { get; set; }
        
		public virtual string AutorLibro { get; set; }
		
		public virtual string Resumen { get; set; }

		public virtual Usuario CreadorPor { get; set; }

		public virtual DateTime CreadorEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}
