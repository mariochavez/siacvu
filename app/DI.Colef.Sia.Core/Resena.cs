using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using System.Collections.Generic;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [HasUniqueDomainSignature]
    [ResenaValidator]
    public class Resena : Entity, IBaseEntity
    {
        const int tipoProducto = 12; // 12 Representa Resena

        public Resena()
        {
            CoautorExternoResenas = new List<CoautorExternoResena>();
            CoautorInternoResenas = new List<CoautorInternoResena>();
            AutorResenas = new List<AutorResena>();
            ArchivoResenas = new List<ArchivoResena>();
        }

        public virtual void AddCoautorExterno(CoautorExternoProducto coautorExterno)
        {
            coautorExterno.TipoProducto = tipoProducto;
            CoautorExternoResenas.Add((CoautorExternoResena)coautorExterno);
        }

        public virtual void AddCoautorInterno(CoautorInternoProducto coautorInterno)
        {
            coautorInterno.TipoProducto = tipoProducto;
            CoautorInternoResenas.Add((CoautorInternoResena)coautorInterno);
        }

        public virtual void AddAutor(AutorResena autorResena)
        {
            AutorResenas.Add(autorResena);
        }

        public virtual void AddArchivo(Archivo archivo)
        {
            archivo.TipoProducto = tipoProducto;
            ArchivoResenas.Add((ArchivoResena)archivo);
        }

        public virtual void DeleteCoautorInterno(CoautorInternoProducto coautorInterno)
        {
            CoautorInternoResenas.Remove((CoautorInternoResena)coautorInterno);
        }

        public virtual void DeleteCoautorExterno(CoautorExternoProducto coautorExterno)
        {
            CoautorExternoResenas.Remove((CoautorExternoResena)coautorExterno);
        }

        public virtual void DeleteAutor(AutorResena autorResena)
        {
            AutorResenas.Remove(autorResena);
        }

        public virtual void DeleteArchivo(Archivo archivo)
        {
            ArchivoResenas.Remove((ArchivoResena) archivo);
        }

        [Valid]
        public virtual IList<ArchivoResena> ArchivoResenas { get; private set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual Departamento Departamento { get; set; }

        public virtual Sede Sede { get; set; }

        [DomainSignature]
        [NotNullNotEmpty]
        public virtual string NombreProducto { get; set; }

        public virtual TipoResena TipoResena { get; set; }

        public virtual IList<CoautorExternoResena> CoautorExternoResenas { get; private set; }

        public virtual IList<CoautorInternoResena> CoautorInternoResenas { get; private set; }

        [Min(1)]
        public virtual int PosicionAutor { get; set; }

        public virtual string TituloLibro { get; set; }

        [Valid]
        public virtual IList<AutorResena> AutorResenas { get; private set; }

        public virtual DateTime FechaEdicion { get; set; }

        public virtual Institucion Institucion { get; set; }
        
        public virtual Editorial Editorial { get; set; }

        public virtual Pais Pais { get; set; }

        public virtual RevistaPublicacion RevistaPublicacion { get; set; }

        public virtual LineaTematica LineaTematica { get; set; }

        public virtual AreaTematica AreaTematica { get; set; }

        public virtual EstadoProducto EstadoProducto { get; set; }

        public virtual DateTime FechaAceptacion { get; set; }

        public virtual DateTime FechaPublicacion { get; set; }
        
        public virtual PeriodoReferencia PeriodoReferencia { get; set; }

        public virtual string Volumen { get; set; }

        public virtual int Numero { get; set; }
        
        public virtual int PaginaInicial { get; set; }

        public virtual int PaginaFinal { get; set; }

        public virtual bool ResenaTraducida { get; set; }

        public virtual Idioma Idioma { get; set; }

        public virtual Area Area { get; set; }

        public virtual Disciplina Disciplina { get; set; }

        public virtual Subdisciplina Subdisciplina { get; set; }

        public virtual string PalabraClave1 { get; set; }

        public virtual string PalabraClave2 { get; set; }

        public virtual string PalabraClave3 { get; set; }

        public virtual int Puntuacion { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}