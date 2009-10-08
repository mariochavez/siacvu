using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;
using System.Collections.Generic;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [HasUniqueDomainSignature]
    [ArticuloValidator]
    public class Articulo : Entity, IBaseEntity, ICoautor
    {
        const int tipoProducto = 1; // 1 Representa Articulo

        public Articulo()
        {
            CoautorExternoArticulos = new List<CoautorExternoArticulo>();
            CoautorInternoArticulos = new List<CoautorInternoArticulo>();
        }

        public virtual void AddCoautorExterno(CoautorExternoProducto coautorExterno)
        {
            coautorExterno.TipoProducto = tipoProducto;
            CoautorExternoArticulos.Add((CoautorExternoArticulo)coautorExterno);
        }

        public virtual void AddCoautorInterno(CoautorInternoProducto coautorInterno)
        {
            coautorInterno.TipoProducto = tipoProducto;
            CoautorInternoArticulos.Add((CoautorInternoArticulo)coautorInterno);
        }

        public virtual void DeleteCoautorInterno(CoautorInternoProducto coautorInterno)
        {
            CoautorInternoArticulos.Remove((CoautorInternoArticulo)coautorInterno);
        }

        public virtual void DeleteCoautorExterno(CoautorExternoProducto coautorExterno)
        {
            CoautorExternoArticulos.Remove((CoautorExternoArticulo)coautorExterno);
        }

        [Valid]
        public virtual IList<CoautorExternoArticulo> CoautorExternoArticulos { get; private set; }

        [Valid]
        public virtual IList<CoautorInternoArticulo> CoautorInternoArticulos { get; private set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual TipoArticulo TipoArticulo { get; set; }

        public virtual Idioma Idioma { get; set; }

        public virtual EstadoProducto EstadoProducto { get; set; }

        public virtual Institucion Institucion { get; set; }

        public virtual PeriodoReferencia PeriodoReferencia { get; set; }

        public virtual DateTime FechaAceptacion { get; set; }

        public virtual DateTime FechaPublicacion { get; set; }

        [DomainSignature]
        [NotNullNotEmpty]
        public virtual string Titulo { get; set; }

        public virtual Pais Pais { get; set; }

        public virtual string Volumen { get; set; }

        public virtual bool TieneProyecto { get; set; }

        public virtual bool ArticuloTraducido { get; set; }

        public virtual int Numero { get; set; }

        public virtual int PosicionAutor { get; set; }

        public virtual int PaginaInicial { get; set; }

        public virtual int PaginaFinal { get; set; }

        public virtual RevistaPublicacion RevistaPublicacion { get; set; }

        public virtual DateTime FechaEdicion { get; set; }

        public virtual LineaInvestigacion LineaInvestigacion { get; set; }

        public virtual TipoActividad TipoActividad { get; set; }

        public virtual TipoParticipacion TipoParticipante { get; set; }

        public virtual int Participantes { get; set; }

        public virtual string PalabraClave1 { get; set; }

        public virtual string PalabraClave2 { get; set; }

        public virtual string PalabraClave3 { get; set; }

        public virtual Area Area { get; set; }

        public virtual Disciplina Disciplina { get; set; }

        public virtual Subdisciplina Subdisciplina { get; set; }

        public virtual Proyecto Proyecto { get; set; }

        public virtual Departamento Departamento { get; set; }

        public virtual Sede Sede { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}
