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
        public Resena()
        {
            CoautorExternoResenas = new List<CoautorExternoResena>();
            CoautorInternoResenas = new List<CoautorInternoResena>();
        }

        public virtual void AddCoautorExterno(CoautorExternoResena coautorExternoResena)
        {
            coautorExternoResena.TipoProducto = 12; // 12 Representa Resena
            CoautorExternoResenas.Add(coautorExternoResena);
        }

        public virtual void AddCoautorInterno(CoautorInternoResena coautorInternoResena)
        {
            coautorInternoResena.TipoProducto = 12; // 12 Representa Resena
            CoautorInternoResenas.Add(coautorInternoResena);
        }

        public virtual TipoResena TipoResena { get; set; }

        public virtual EstadoProducto EstadoProducto { get; set; }

        public virtual PeriodoReferencia PeriodoReferencia { get; set; }

        public virtual DateTime FechaAceptacion { get; set; }

        public virtual Proyecto Proyecto { get; set; }

        public virtual LineaTematica LineaTematica { get; set; }

        public virtual DateTime FechaEdicion { get; set; }

        public virtual IList<CoautorExternoResena> CoautorExternoResenas { get; private set; }

        public virtual IList<CoautorInternoResena> CoautorInternoResenas { get; private set; }

        public virtual string ReferenciaBibliograficaLibro { get; set; }

        public virtual string ReferenciaBibliograficaRevista { get; set; }

        [DomainSignature]
        public virtual string NombreProducto { get; set; }

        public virtual Pais Pais { get; set; }

        public virtual int PaginaInicial { get; set; }

        public virtual int PaginaFinal { get; set; }

        public virtual string TituloLibro { get; set; }

        public virtual string NombreRevista { get; set; }

        public virtual string Editorial { get; set; }

        public virtual string PalabraClave1 { get; set; }

        public virtual string PalabraClave2 { get; set; }

        public virtual string PalabraClave3 { get; set; }

        public virtual Area Area { get; set; }

        public virtual Disciplina Disciplina { get; set; }

        public virtual Subdisciplina Subdisciplina { get; set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual Departamento Departamento { get; set; }

        public virtual Sede Sede { get; set; }

        public virtual int Puntuacion { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}
