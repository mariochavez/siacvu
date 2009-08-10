using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using System.Collections.Generic;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class Reseña : Entity, IBaseEntity
    {
        public Reseña()
        {
            CoautorExternoReseñas = new List<CoautorExternoReseña>();
            CoautorInternoReseñas = new List<CoautorInternoReseña>();
        }

        public virtual void AddCoautorExterno(CoautorExternoReseña coautorExternoReseña)
        {
            CoautorExternoReseñas.Add(coautorExternoReseña);
        }
        public virtual void AddCoautorInterno(CoautorInternoReseña coautorInternoReseña)
        {
            CoautorInternoReseñas.Add(coautorInternoReseña);
        }


        public virtual EstadoProducto EstadoProducto { get; set; }

        public virtual PeriodoReferencia PeriodoReferencia { get; set; }

        public virtual DateTime FechaAceptacion { get; set; }

        public virtual Proyecto Proyecto { get; set; }

        public virtual LineaTematica LineaTematica { get; set; }

        public virtual DateTime FechaEdicion { get; set; }

        public virtual IList<CoautorExternoReseña> CoautorExternoReseñas { get; private set; }

        public virtual IList<CoautorInternoReseña> CoautorInternoReseñas { get; private set; }

        public virtual string ReferenciaBibliograficaLibro { get; set; }

        public virtual string ReferenciaBibliograficaRevista { get; set; }

        public virtual string NombreProducto { get; set; }

        public virtual Pais Pais { get; set; }

        public virtual int PaginaInicial { get; set; }

        public virtual int PaginaFinal { get; set; }

        public virtual string TituloLibro { get; set; }

        [NotNullNotEmpty]
        public virtual string NombreRevista { get; set; }

        public virtual string Editorial { get; set; }

        public virtual string PalabrasClave { get; set; }

        public virtual Area Area { get; set; }

        public virtual Disciplina Disciplina { get; set; }

        public virtual Subdisciplina Subdisciplina { get; set; }

        public virtual Investigador Investigador { get; set; }

        public virtual int Puntuacion { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}
