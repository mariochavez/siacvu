using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;
using System.Collections.Generic;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [HasUniqueDomainSignature]
    public class Articulo : Entity, IBaseEntity
    {
        public Articulo()
        {
            CoautorExternoArticulos = new List<CoautorExternoArticulo>();
            CoautorInternoArticulos = new List<CoautorInternoArticulo>();
        }

        public virtual void AddCoautorExterno(CoautorExternoArticulo coautorExternoArticulo)
        {
            CoautorExternoArticulos.Add(coautorExternoArticulo);
        }

        public virtual void AddCoautorInterno(CoautorInternoArticulo coautorInternoArticulo)
        {
            CoautorInternoArticulos.Add(coautorInternoArticulo);
        }

        [NotNull]
        public virtual TipoArticulo TipoArticulo { get; set; }

        [NotNull]
        public virtual Idioma Idioma { get; set; }

        [NotNull]
        public virtual Estado Estado { get; set; }

        [NotNull]
        public virtual PeriodoReferencia PeriodoReferencia { get; set; }

        [NotEmptyDate]
        public virtual DateTime FechaAceptacion { get; set; }

        [NotNull]
        public virtual LineaTematica LineaTematica { get; set; }

        [DomainSignature]
        [NotNullNotEmpty]
        public virtual string Titulo { get; set; }

        [NotNull]
        public virtual Pais Pais { get; set; }

        [NotNullNotEmpty]
        public virtual string Volumen { get; set; }

        [NotNull]
        //[IsNumeric]
        public virtual int Numero { get; set; }

        [NotNull]
        //[IsNumeric]
        public virtual int PaginaInicial { get; set; }

        [NotNull]
        //[IsNumeric]
        public virtual int PaginaFinal { get; set; }

        [NotNull]
        public virtual RevistaPublicacion RevistaPublicacion { get; set; }

        [NotNull]
        public virtual Institucion Institucion { get; set; }

        [NotNull]
        public virtual Indice Indice1 { get; set; }

        [NotNull]
        public virtual Indice Indice2 { get; set; }

        [NotNull]
        public virtual Indice Indice3 { get; set; }

        [NotEmptyDate]
        public virtual DateTime FechaEdicion { get; set; }

        [Valid]
        public virtual IList<CoautorExternoArticulo> CoautorExternoArticulos { get; private set; }

        [Valid]
        public virtual IList<CoautorInternoArticulo> CoautorInternoArticulos { get; private set; }

        [NotNull]
        public virtual LineaInvestigacion LineaInvestigacion { get; set; }

        [NotNull]
        public virtual TipoActividad TipoActividad { get; set; }

        [NotNull]
        public virtual TipoParticipante TipoParticipante { get; set; }

        public virtual int Particpantes { get; set; }

        public virtual string PalabrasClaves { get; set; }

        [NotNull]
        public virtual Area Area { get; set; }

        [NotNull]
        public virtual Disciplina Disciplina { get; set; }

        [NotNull]
        public virtual Subdisciplina Subdisciplina { get; set; }

        [NotEmptyDate]
        public virtual DateTime FechaPublicacion { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}
