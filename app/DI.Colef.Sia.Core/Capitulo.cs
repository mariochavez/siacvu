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
	public class Capitulo : Entity, IBaseEntity, IAutor, ICoautor, IEditorial
    {
        const int tipoProducto = 2; // 2 Representa Capitulo

		public Capitulo()
		{
			CoautorExternoCapitulos = new List<CoautorExternoCapitulo>();
            CoautorInternoCapitulos = new List<CoautorInternoCapitulo>();
            AutorInternoCapitulos = new List<AutorInternoCapitulo>();
            AutorExternoCapitulos = new List<AutorExternoCapitulo>();
            FirmaCapitulos = new List<FirmaCapitulo>();
            ArchivoCapitulos = new List<ArchivoCapitulo>();
            EditorialCapitulos = new List<EditorialCapitulo>();
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
        public virtual void AddAutorInterno(AutorInternoProducto autorInterno)
        {
            autorInterno.TipoProducto = tipoProducto;
            AutorInternoCapitulos.Add((AutorInternoCapitulo)autorInterno);
        }
        public virtual void AddAutorExterno(AutorExternoProducto autorExterno)
        {
            autorExterno.TipoProducto = tipoProducto;
            AutorExternoCapitulos.Add((AutorExternoCapitulo)autorExterno);
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

        public virtual void AddEditorial(EditorialProducto editorial)
        {
            editorial.TipoProducto = tipoProducto;
            EditorialCapitulos.Add((EditorialCapitulo) editorial);
        }

        public virtual void DeleteEditorial(EditorialProducto editorial)
        {
            EditorialCapitulos.Remove((EditorialCapitulo) editorial);
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

        public virtual void DeleteAutorInterno(AutorInternoProducto coautorInterno)
        {
            AutorInternoCapitulos.Remove((AutorInternoCapitulo)coautorInterno);
        }

        public virtual void DeleteAutorExterno(AutorExternoProducto coautorExterno)
        {
            AutorExternoCapitulos.Remove((AutorExternoCapitulo)coautorExterno);
        }

        [DomainSignature]
        [NotNullNotEmpty]
        public virtual string NombreCapitulo { get; set; }

        public virtual int TipoCapitulo { get; set; }

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

        public virtual Subdisciplina Subdisciplina { get; set; }

        public virtual int EstadoProducto { get; set; }

		public virtual DateTime FechaAceptacion { get; set; }

        public virtual DateTime FechaPublicacion { get; set; }

        public virtual string NombreLibro { get; set; }

        public virtual string AutorLibro { get; set; }

        public virtual int TipoLibro { get; set; }

        public virtual string Resumen { get; set; }

        public virtual Editorial Editorial { get; set; }

        public virtual int Volumen { get; set; }

        public virtual int NoPaginas { get; set; }

        public virtual int NoCitas { get; set; }

        [Valid]
        public virtual IList<AutorInternoCapitulo> AutorInternoCapitulos { get; private set; }

        [Valid]
        public virtual IList<AutorExternoCapitulo> AutorExternoCapitulos { get; private set; }

        [Valid]
        public virtual IList<EditorialCapitulo> EditorialCapitulos { get; private set; }

        public virtual int Puntuacion { get; set; }

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
