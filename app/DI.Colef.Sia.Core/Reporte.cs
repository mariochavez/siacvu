using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using System.Collections.Generic;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [HasUniqueDomainSignature]
    [ReporteValidator]
    public class Reporte : Entity, IBaseEntity
    {
        public Reporte()
        {
            CoautorExternoReportes = new List<CoautorExternoReporte>();
            CoautorInternoReportes = new List<CoautorInternoReporte>();
        }

        public virtual void AddCoautorExterno(CoautorExternoReporte coautorExternoReporte)
        {
            CoautorExternoReportes.Add(coautorExternoReporte);
        }

        public virtual void AddCoautorInterno(CoautorInternoReporte coautorInternoReporte)
        {
            CoautorInternoReportes.Add(coautorInternoReporte);
        }

        public virtual TipoReporte TipoReporte { get; set; }

        public virtual EstadoProducto EstadoProducto { get; set; }

        public virtual PeriodoReferencia PeriodoReferencia { get; set; }

        public virtual DateTime FechaAceptacion { get; set; }

        public virtual Proyecto Proyecto { get; set; }

        public virtual LineaTematica LineaTematica { get; set; }

        [DomainSignature]
        [NotNullNotEmpty]
        public virtual string Titulo { get; set; }

        public virtual bool TieneProyecto { get; set; }

        public virtual DateTime FechaEdicion { get; set; }

        [Valid]
        public virtual IList<CoautorExternoReporte> CoautorExternoReportes { get; private set; }

        [Valid]
        public virtual IList<CoautorInternoReporte> CoautorInternoReportes { get; private set; }

        public virtual Institucion Institucion { get; set; }

        public virtual string Editorial { get; set; }

        public virtual Pais Pais { get; set; }

        public virtual int NoPaginas { get; set; }

        public virtual string Descripcion { get; set; }

        public virtual string Objetivo { get; set; }

        public virtual string PalabraClave1 { get; set; }

        public virtual string PalabraClave2 { get; set; }

        public virtual string PalabraClave3 { get; set; }

        public virtual int Puntuacion { get; set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual DateTime Fecha { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}
