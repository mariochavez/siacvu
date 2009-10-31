using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using System.Collections.Generic;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [HasUniqueDomainSignature]
    [EventoValidator]
    public class Evento : Entity, IBaseEntity
    {
        const int tipoProducto = 6; // 6 Representa Evento

        public Evento()
        {
            CoautorExternoEventos = new List<CoautorExternoEvento>();
            CoautorInternoEventos = new List<CoautorInternoEvento>();
            ArchivoEventos = new List<ArchivoEvento>();
            FirmaEventos = new List<FirmaEvento>();
            InstitucionEventos = new List<InstitucionEvento>();
        }

        public virtual void AddCoautorExterno(CoautorExternoProducto coautorExterno)
        {
            coautorExterno.TipoProducto = tipoProducto;
            CoautorExternoEventos.Add((CoautorExternoEvento) coautorExterno);
        }

        public virtual void AddCoautorInterno(CoautorInternoProducto coautorInterno)
        {
            coautorInterno.TipoProducto = tipoProducto;
            CoautorInternoEventos.Add((CoautorInternoEvento) coautorInterno);
        }

        public virtual void AddArchivo(Archivo archivo)
        {
            archivo.TipoProducto = tipoProducto;
            ArchivoEventos.Add((ArchivoEvento)archivo);
        }

        public virtual void AddFirma(Firma firma)
        {
            firma.TipoProducto = tipoProducto;
            FirmaEventos.Add((FirmaEvento)firma);
        }

        public virtual void AddInstitucion(InstitucionEvento institucion)
        {
            InstitucionEventos.Add(institucion);
        }

        public virtual void DeleteInstitucion(InstitucionEvento institucion)
        {
            InstitucionEventos.Remove(institucion);
        }

        public virtual void DeleteFirma(Firma firma)
        {
            FirmaEventos.Remove((FirmaEvento)firma);
        }

        public virtual void DeleteCoautorInterno(CoautorInternoProducto coautorInterno)
        {
            CoautorInternoEventos.Remove((CoautorInternoEvento) coautorInterno);
        }

        public virtual void DeleteCoautorExterno(CoautorExternoProducto coautorExterno)
        {
            CoautorExternoEventos.Remove((CoautorExternoEvento) coautorExterno);
        }

        public virtual void DeleteArchivo(Archivo archivo)
        {
            ArchivoEventos.Remove((ArchivoEvento)archivo);
        }

        [Valid]
        public virtual IList<ArchivoEvento> ArchivoEventos { get; private set; }

        [Valid]
        public virtual IList<FirmaEvento> FirmaEventos { get; private set; }

        [NotNullNotEmpty]
        [DomainSignature]
        public virtual string Nombre { get; set; }

        public virtual TipoEvento TipoEvento { get; set; }

        public virtual TipoParticipacion TipoParticipacion { get; set; }

        [Valid]
        public virtual IList<InstitucionEvento> InstitucionEventos { get; private set; }

        public virtual string PalabraClave1 { get; set; }

        public virtual string PalabraClave2 { get; set; }

        public virtual string PalabraClave3 { get; set; }

        public virtual Ambito Ambito { get; set; }

        public virtual bool Invitacion { get; set; }

        public virtual string TituloTrabajo { get; set; }

        [Valid]
        public virtual IList<CoautorExternoEvento> CoautorExternoEventos { get; private set; }

        [Valid]
        public virtual IList<CoautorInternoEvento> CoautorInternoEventos { get; private set; }

        public virtual DateTime FechaEvento { get; set; }

        public virtual string Lugar { get; set; }

        public virtual Pais Pais { get; set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual Departamento Departamento { get; set; }

        public virtual Sede Sede { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}
