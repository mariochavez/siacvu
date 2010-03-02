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
    public class Resena : Entity, IBaseEntity, IAutor, ICoautor, IEditorial
    {
        const int tipoProducto = 12; // 12 Representa Resena

        public virtual int TipoProducto { get { return tipoProducto; } }

        public Resena()
        {
            CoautorExternoResenas = new List<CoautorExternoResena>();
            CoautorInternoResenas = new List<CoautorInternoResena>();
            AutorInternoResenas = new List<AutorInternoResena>();
            AutorExternoResenas = new List<AutorExternoResena>();
            EditorialResenas = new List<EditorialResena>();
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

        public virtual void AddAutorInterno(AutorInternoProducto autorInterno)
        {
            autorInterno.TipoProducto = tipoProducto;
            AutorInternoResenas.Add((AutorInternoResena)autorInterno);
        }
        public virtual void AddAutorExterno(AutorExternoProducto autorExterno)
        {
            autorExterno.TipoProducto = tipoProducto;
            AutorExternoResenas.Add((AutorExternoResena)autorExterno);
        }

        public virtual void AddEditorial(EditorialProducto editorial)
        {
            editorial.TipoProducto = tipoProducto;
            EditorialResenas.Add((EditorialResena)editorial);
        }

        public virtual void DeleteEditorial(EditorialProducto editorial)
        {
            EditorialResenas.Remove((EditorialResena)editorial);
        }

        public virtual void DeleteCoautorInterno(CoautorInternoProducto coautorInterno)
        {
            CoautorInternoResenas.Remove((CoautorInternoResena)coautorInterno);
        }

        public virtual void DeleteCoautorExterno(CoautorExternoProducto coautorExterno)
        {
            CoautorExternoResenas.Remove((CoautorExternoResena)coautorExterno);
        }

        public virtual void DeleteAutorInterno(AutorInternoProducto coautorInterno)
        {
            AutorInternoResenas.Remove((AutorInternoResena)coautorInterno);
        }

        public virtual void DeleteAutorExterno(AutorExternoProducto coautorExterno)
        {
            AutorExternoResenas.Remove((AutorExternoResena)coautorExterno);
        }

        [DomainSignature]
        [NotNullNotEmpty]
        public virtual string NombreProducto { get; set; }

        public virtual int TipoResena { get; set; }

        public virtual AreaTematica AreaTematica { get; set; }

        public virtual string PalabraClave1 { get; set; }

        public virtual string PalabraClave2 { get; set; }

        public virtual string PalabraClave3 { get; set; }

        public virtual Area Area { get; set; }

        public virtual Disciplina Disciplina { get; set; }

        public virtual Subdisciplina Subdisciplina { get; set; }

        public virtual bool CoautorSeOrdenaAlfabeticamente { get; set; }

        [Valid]
        public virtual IList<CoautorExternoResena> CoautorExternoResenas { get; private set; }

        [Valid]
        public virtual IList<CoautorInternoResena> CoautorInternoResenas { get; private set; }

        [Valid]
        public virtual Firma Firma { get; set; }

        [Valid]
        public virtual Archivo ComprobanteAceptado { get; set; }

        [Valid]
        public virtual Archivo ComprobanteResena { get; set; }

        public virtual int PosicionCoautor { get; set; }

        public virtual int EstadoProducto { get; set; }

        public virtual DateTime FechaAceptacion { get; set; }

        public virtual DateTime FechaPublicacion { get; set; }

        public virtual string TituloLibro { get; set; }

        public virtual bool AutorSeOrdenaAlfabeticamente { get; set; }

        [Valid]
        public virtual IList<AutorInternoResena> AutorInternoResenas { get; private set; }

        [Valid]
        public virtual IList<AutorExternoResena> AutorExternoResenas { get; private set; }

        public virtual int PosicionAutor { get; set; }

        [Valid]
        public virtual IList<EditorialResena> EditorialResenas { get; private set; }
        
        public virtual Pais Pais { get; set; }

        public virtual RevistaPublicacion RevistaPublicacion { get; set; }

        public virtual string RevistaPublicacionTitulo { get; set; }

        public virtual Editorial Editorial { get; set; }
        
        public virtual string Volumen { get; set; }

        public virtual string Numero { get; set; }
        
        public virtual int PaginaInicial { get; set; }

        public virtual int PaginaFinal { get; set; }

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