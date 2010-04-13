using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [ObraTraducidaValidator]
	[HasUniqueDomainSignature]
    public class ObraTraducida : Entity, IBaseEntity, IAutor, ICoautor, IEditorial
    {
        const int tipoProducto = 20; // 20 Representa Obra Traducida

        public virtual int TipoProducto { get { return tipoProducto; } }

		public ObraTraducida()
		{
            CoautorExternoObraTraducidas = new List<CoautorExternoObraTraducida>();
            CoautorInternoObraTraducidas = new List<CoautorInternoObraTraducida>();
            AutorInternoObraTraducidas = new List<AutorInternoObraTraducida>();
            AutorExternoObraTraducidas = new List<AutorExternoObraTraducida>();
            EditorialObraTraducidas = new List<EditorialObraTraducida>();
            ArchivosObraTraducida = new List<ArchivoObraTraducida>();
		}

        public virtual IList<ArchivoObraTraducida> ArchivosObraTraducida { get; private set; }

        public virtual void AddArchivo(Archivo archivo)
        {
            archivo.TipoProducto = tipoProducto;
            ArchivosObraTraducida.Add((ArchivoObraTraducida) archivo);
        }

        public virtual void DeleteArchivo(Archivo archivo)
        {
            ArchivosObraTraducida.Remove((ArchivoObraTraducida) archivo);
        }

        public virtual void AddCoautorExterno(CoautorExternoProducto coautorExterno)
        {
            coautorExterno.TipoProducto = tipoProducto;
            CoautorExternoObraTraducidas.Add((CoautorExternoObraTraducida)coautorExterno);
        }

        public virtual void AddCoautorInterno(CoautorInternoProducto coautorInterno)
        {
            coautorInterno.TipoProducto = tipoProducto;
            CoautorInternoObraTraducidas.Add((CoautorInternoObraTraducida)coautorInterno);
        }
        public virtual void AddAutorInterno(AutorInternoProducto autorInterno)
        {
            autorInterno.TipoProducto = tipoProducto;
            AutorInternoObraTraducidas.Add((AutorInternoObraTraducida)autorInterno);
        }
        public virtual void AddAutorExterno(AutorExternoProducto autorExterno)
        {
            autorExterno.TipoProducto = tipoProducto;
            AutorExternoObraTraducidas.Add((AutorExternoObraTraducida)autorExterno);
        }

        public virtual void AddEditorial(EditorialProducto editorial)
        {
            editorial.TipoProducto = tipoProducto;
            EditorialObraTraducidas.Add((EditorialObraTraducida)editorial);
        }

        public virtual void DeleteEditorial(EditorialProducto editorial)
        {
            EditorialObraTraducidas.Remove((EditorialObraTraducida)editorial);
        }

        public virtual void DeleteCoautorInterno(CoautorInternoProducto coautorInterno)
        {
            CoautorInternoObraTraducidas.Remove((CoautorInternoObraTraducida)coautorInterno);
        }

        public virtual void DeleteCoautorExterno(CoautorExternoProducto coautorExterno)
        {
            CoautorExternoObraTraducidas.Remove((CoautorExternoObraTraducida)coautorExterno);
        }

        public virtual void DeleteAutorInterno(AutorInternoProducto coautorInterno)
        {
            AutorInternoObraTraducidas.Remove((AutorInternoObraTraducida)coautorInterno);
        }

        public virtual void DeleteAutorExterno(AutorExternoProducto coautorExterno)
        {
            AutorExternoObraTraducidas.Remove((AutorExternoObraTraducida)coautorExterno);
        }

        public virtual bool CoautorSeOrdenaAlfabeticamente { get; set; }

        [Valid]
        public virtual IList<CoautorExternoObraTraducida> CoautorExternoObraTraducidas { get; private set; }

        [Valid]
        public virtual IList<CoautorInternoObraTraducida> CoautorInternoObraTraducidas { get; private set; }

        [Valid]
        public virtual Firma Firma { get; set; }

        public virtual bool AutorSeOrdenaAlfabeticamente { get; set; }

        [Valid]
        public virtual IList<AutorInternoObraTraducida> AutorInternoObraTraducidas { get; private set; }

        [Valid]
        public virtual IList<AutorExternoObraTraducida> AutorExternoObraTraducidas { get; private set; }

        public virtual int PosicionAutor { get; set; }

        [Valid]
        public virtual IList<EditorialObraTraducida> EditorialObraTraducidas { get; private set; }

		[DomainSignature]
		[NotNullNotEmpty]
		public virtual string Nombre { get; set; }

		public virtual Idioma Idioma { get; set; }

		public virtual string NombreTraductor { get; set; }

		public virtual string ApellidoPaterno { get; set; }

		public virtual string ApellidoMaterno { get; set; }

		public virtual string NombreObraTraducida { get; set; }

		public virtual int TipoObraTraducida { get; set; }

		public virtual AreaTematica AreaTematica { get; set; }

		public virtual string PalabraClave1 { get; set; }

		public virtual string PalabraClave2 { get; set; }

		public virtual string PalabraClave3 { get; set; }

		public virtual int EstadoProducto { get; set; }

		public virtual DateTime FechaAceptacion { get; set; }

		public virtual DateTime FechaPublicacion { get; set; }

		public virtual RevistaPublicacion RevistaPublicacion { get; set; }

        public virtual string RevistaPublicacionTitulo { get; set; }

		public virtual string Volumen { get; set; }

        public virtual string Numero { get; set; }

		public virtual int PaginaInicial { get; set; }

		public virtual int PaginaFinal { get; set; }

		public virtual string NombreLibro { get; set; }

		public virtual int TipoLibro { get; set; }

        public virtual int NoPaginas { get; set; }

		public virtual string Resumen { get; set; }

        public virtual int NoCitas { get; set; }

		public virtual string ISBN { get; set; }

        public virtual int Edicion { get; set; }

		public virtual int Reimpresion { get; set; }

		public virtual int Tiraje { get; set; }

        public virtual decimal Puntuacion { get; set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual Departamento Departamento { get; set; }

        public virtual Sede Sede { get; set; }

        public virtual int PosicionCoautor { get; set; }

		public virtual Usuario CreadoPor { get; set; }

		public virtual DateTime CreadoEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}
