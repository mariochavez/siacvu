using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;
using System.Collections.Generic;

namespace DecisionesInteligentes.Colef.Sia.Core
{
	[HasUniqueDomainSignature]
    [LibroValidator]
    public class Libro : Entity, IBaseEntity, ICoautor, IEditorial
    {
        const int tipoProducto = 7; // 7 Representa Libro

        public virtual int TipoProductoLibro { get { return tipoProducto; } }

		public Libro()
		{
			CoautorExternoLibros = new List<CoautorExternoLibro>();
            CoautorInternoLibros = new List<CoautorInternoLibro>();
            EditorialLibros = new List<EditorialLibro>();
		}

        public virtual void AddCoautorExterno(CoautorExternoProducto coautorExterno)
        {
            coautorExterno.TipoProducto = tipoProducto;
            CoautorExternoLibros.Add((CoautorExternoLibro)coautorExterno);
        }

        public virtual void AddCoautorInterno(CoautorInternoProducto coautorInterno)
        {
            coautorInterno.TipoProducto = tipoProducto;
            CoautorInternoLibros.Add((CoautorInternoLibro)coautorInterno);
        }

        public virtual void AddEditorial(EditorialProducto editorial)
        {

            editorial.TipoProducto = tipoProducto;
            EditorialLibros.Add((EditorialLibro) editorial);
        }

	    public virtual void DeleteEditorial(EditorialProducto editorial)
        {
            EditorialLibros.Remove((EditorialLibro) editorial);
        }

        public virtual void DeleteCoautorInterno(CoautorInternoProducto coautorInterno)
        {
            CoautorInternoLibros.Remove((CoautorInternoLibro)coautorInterno);
        }

        public virtual void DeleteCoautorExterno(CoautorExternoProducto coautorExterno)
        {
            CoautorExternoLibros.Remove((CoautorExternoLibro)coautorExterno);
        }

        [DomainSignature]
        [NotNullNotEmpty]
        public virtual string Nombre { get; set; }

        public virtual int FormatoPublicacion { get; set; }

        public virtual int TipoProducto { get; set; }

        public virtual int ContenidoLibro { get; set; }

        public virtual Evento Evento { get; set; }

        public virtual bool TieneProyecto { get; set; }

        public virtual Proyecto Proyecto { get; set; }

        public virtual AreaTematica AreaTematica { get; set; }

        public virtual string PalabraClave1 { get; set; }

        public virtual string PalabraClave2 { get; set; }

        public virtual string PalabraClave3 { get; set; }

        public virtual Area Area { get; set; }

        [Valid]
        public virtual Archivo ComprobanteAceptado { get; set; }

        [Valid]
        public virtual Archivo ComprobanteLibro { get; set; }

        public virtual Disciplina Disciplina { get; set; }

        public virtual Subdisciplina Subdisciplina { get; set; }

        public virtual bool CoautorSeOrdenaAlfabeticamente { get; set; }

        [Valid]
        public virtual IList<CoautorExternoLibro> CoautorExternoLibros { get; private set; }

        [Valid]
        public virtual IList<CoautorInternoLibro> CoautorInternoLibros { get; private set; }

        [Valid]
	    public virtual Firma Firma { get; set; }

	    public virtual int PosicionCoautor { get; set; }

        public virtual int EstadoProducto { get; set; }

        public virtual DateTime FechaAceptacion { get; set; }

        public virtual DateTime FechaPublicacion { get; set; }

        [Valid]
        public virtual IList<EditorialLibro> EditorialLibros { get; private set; }

        public virtual string ISBN { get; set; }

        public virtual int Edicion { get; set; }

        public virtual int Reimpresion { get; set; }

        public virtual string Volumen { get; set; }

        public virtual int NoPaginas { get; set; }

        public virtual int Tiraje { get; set; }
        
        public virtual string Numero { get; set; }

        public virtual RevistaPublicacion RevistaPublicacion { get; set; }

		public virtual decimal Puntuacion { get; set; }

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