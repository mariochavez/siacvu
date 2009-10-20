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
            FirmaCapitulos = new List<FirmaCapitulo>();
            ArchivoCapitulos = new List<ArchivoCapitulo>();
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

        public virtual void AddFirma(Firma firma)
        {
            firma.TipoProducto = tipoProducto;
            FirmaCapitulos.Add((FirmaCapitulo)firma);
        }

        public virtual void AddArchivo(Archivo archivo)
        {
            archivo.TipoProducto = tipoProducto;
            ArchivoCapitulos.Add((ArchivoCapitulo)archivo);
        }

        public virtual void DeleteArchivo(Archivo archivo)
        {
            ArchivoCapitulos.Remove((ArchivoCapitulo)archivo);
        }

        public virtual void DeleteFirma(Firma firma)
        {
            FirmaCapitulos.Remove((FirmaCapitulo)firma);
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

        [DomainSignature]
        [NotNullNotEmpty]
        public virtual string NombreCapitulo { get; set; }

        public virtual TipoCapitulo TipoCapitulo { get; set; }

        public virtual Idioma Idioma { get; set; }

        [Valid]
        public virtual IList<CoautorExternoCapitulo> CoautorExternoCapitulos { get; private set; }

        [Valid]
        public virtual IList<CoautorInternoCapitulo> CoautorInternoCapitulos { get; private set; }

        [Valid]
        public virtual IList<FirmaCapitulo> FirmaCapitulos { get; private set; }

        [Valid]
        public virtual IList<ArchivoCapitulo> ArchivoCapitulos { get; private set; }

        [Min(1)]
        public virtual int PosicionAutor { get; set; }

        public virtual bool TieneProyecto { get; set; }

        public virtual Proyecto Proyecto { get; set; }

        public virtual AreaTematica AreaTematica { get; set; }

        public virtual EstadoProducto EstadoProducto { get; set; }

		public virtual DateTime FechaAceptacion { get; set; }

        public virtual DateTime FechaPublicacion { get; set; }

        public virtual string NombreLibro { get; set; }

        public virtual string AutorLibro { get; set; }

        public virtual string Resumen { get; set; }

        public virtual Editorial Editorial { get; set; }

        public virtual int Volumen { get; set; }

		public virtual DateTime FechaEdicion { get; set; }

        public virtual Pais Pais { get; set; }

        public virtual int NoPaginas { get; set; }

        [Valid]
        public virtual IList<ResponsableInternoCapitulo> ResponsableInternoCapitulos { get; private set; }

        [Valid]
        public virtual IList<ResponsableExternoCapitulo> ResponsableExternoCapitulos { get; private set; }

        public virtual int Puntuacion { get; set; }
        
		public virtual TipoParticipacion TipoParticipacion { get; set; }
        
		public virtual TipoParticipante TipoParticipante { get; set; }
        
		public virtual bool Traductor { get; set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual Departamento Departamento { get; set; }

        public virtual Sede Sede { get; set; }

		public virtual Usuario CreadorPor { get; set; }

		public virtual DateTime CreadorEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}
