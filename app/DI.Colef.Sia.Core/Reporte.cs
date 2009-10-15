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
    public class Reporte : Entity, IBaseEntity, ICoautor
    {
        const int tipoProducto = 11; // 11 Representa Reporte

        public Reporte()
        {
            CoautorExternoReportes = new List<CoautorExternoReporte>();
            CoautorInternoReportes = new List<CoautorInternoReporte>();
            ArchivoReportes = new List<ArchivoReporte>();
        }

        public virtual void AddCoautorExterno(CoautorExternoProducto coautorExterno)
        {
            coautorExterno.TipoProducto = tipoProducto;
            CoautorExternoReportes.Add((CoautorExternoReporte) coautorExterno);
        }

        public virtual void AddCoautorInterno(CoautorInternoProducto coautorInterno)
        {
            coautorInterno.TipoProducto = tipoProducto;
            CoautorInternoReportes.Add((CoautorInternoReporte) coautorInterno);
        }

        public virtual void AddArchivo(Archivo archivo)
        {
            archivo.TipoProducto = tipoProducto;
            ArchivoReportes.Add((ArchivoReporte)archivo);
        }

        public virtual void DeleteCoautorInterno(CoautorInternoProducto coautorInterno)
        {
            CoautorInternoReportes.Remove((CoautorInternoReporte)coautorInterno);
        }

        public virtual void DeleteCoautorExterno(CoautorExternoProducto coautorExterno)
        {
            CoautorExternoReportes.Remove((CoautorExternoReporte) coautorExterno);
        }

        public virtual void DeleteArchivo(Archivo archivo)
        {
            ArchivoReportes.Remove((ArchivoReporte) archivo);
        }

        [Valid]
        public virtual IList<ArchivoReporte> ArchivoReportes { get; private set; }

        public virtual TipoReporte TipoReporte { get; set; }

        [Min(1)]
        public virtual int PosicionAutor { get; set; }

        public virtual EstadoProducto EstadoProducto { get; set; }

        public virtual PeriodoReferencia PeriodoReferencia { get; set; }

        public virtual DateTime FechaAceptacion { get; set; }

        public virtual DateTime FechaPublicacion { get; set; }

        public virtual bool TieneProyecto { get; set; }

        public virtual Proyecto Proyecto { get; set; }

        [DomainSignature]
        [NotNullNotEmpty]
        public virtual string Titulo { get; set; }

        public virtual DateTime FechaEdicion { get; set; }

        [Valid]
        public virtual IList<CoautorExternoReporte> CoautorExternoReportes { get; private set; }

        [Valid]
        public virtual IList<CoautorInternoReporte> CoautorInternoReportes { get; private set; }

        //public virtual string Editorial { get; set; }

        //public virtual Pais Pais { get; set; }

        public virtual int NoPaginas { get; set; }

        public virtual string Descripcion { get; set; }

        public virtual string Objetivo { get; set; }

        public virtual string PalabraClave1 { get; set; }

        public virtual string PalabraClave2 { get; set; }

        public virtual string PalabraClave3 { get; set; }

        public virtual int Puntuacion { get; set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual Departamento Departamento { get; set; }

        public virtual Sede Sede { get; set; }

        //public virtual DateTime Fecha { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}
