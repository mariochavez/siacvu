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
    public class Evento : Entity, IBaseEntity, IInstitucion
    {
        const int tipoProducto = 6; // 6 Representa Evento

        public virtual int TipoProducto { get { return tipoProducto; } }

        public Evento()
        {
            SesionEventos = new List<SesionEvento>();
            CoautorExternoEventos = new List<CoautorExternoEvento>();
            CoautorInternoEventos = new List<CoautorInternoEvento>();
            InstitucionEventos = new List<InstitucionEvento>();
            ArchivosEvento = new List<ArchivoEvento>();
        }

        public virtual IList<ArchivoEvento> ArchivosEvento { get; private set; }

        public virtual void AddArchivo(Archivo archivo)
        {
            archivo.TipoProducto = tipoProducto;
            ArchivosEvento.Add((ArchivoEvento) archivo);
        }

        public virtual void DeleteArchivo(Archivo archivo)
        {
            ArchivosEvento.Remove((ArchivoEvento) archivo);
        }

        public virtual void AddSesion(SesionEvento sesionEvento)
        {
            SesionEventos.Add(sesionEvento);
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

        public virtual void AddInstitucion(InstitucionProducto institucion)
        {
            institucion.TipoProducto = tipoProducto;
            InstitucionEventos.Add((InstitucionEvento) institucion);
        }

        public virtual void DeleteInstitucion(InstitucionProducto institucion)
        {
            InstitucionEventos.Remove((InstitucionEvento) institucion);
        }

        public virtual void DeleteSesion(SesionEvento sesionEvento)
        {
            SesionEventos.Remove(sesionEvento);
        }

        public virtual void DeleteCoautorInterno(CoautorInternoProducto coautorInterno)
        {
            CoautorInternoEventos.Remove((CoautorInternoEvento) coautorInterno);
        }

        public virtual void DeleteCoautorExterno(CoautorExternoProducto coautorExterno)
        {
            CoautorExternoEventos.Remove((CoautorExternoEvento) coautorExterno);
        }

        [Valid]
        public virtual Firma Firma { get; set; }

        [Valid]
        public virtual IList<SesionEvento> SesionEventos { get; private set; }

        [NotNullNotEmpty]
        [DomainSignature]
        public virtual string Nombre { get; set; }

        public virtual TipoEvento TipoEvento { get; set; }

        public virtual AreaTematica AreaTematica { get; set; }

        public virtual string ObjetivoEvento { get; set; }

        public virtual int FinanciamientoInterno { get; set; }

        public virtual int FinanciamientoExterno { get; set; }

        public virtual int SesionesTrabajo { get; set; }

        public virtual TipoParticipacion TipoParticipacion { get; set; }

        [Valid]
        public virtual IList<InstitucionEvento> InstitucionEventos { get; private set; }

        public virtual string PalabraClave1 { get; set; }

        public virtual string PalabraClave2 { get; set; }

        public virtual string PalabraClave3 { get; set; }

        public virtual bool Invitacion { get; set; }

        public virtual string TituloTrabajo { get; set; }

        public virtual bool CoautorSeOrdenaAlfabeticamente { get; set; }

        [Valid]
        public virtual IList<CoautorExternoEvento> CoautorExternoEventos { get; private set; }

        [Valid]
        public virtual IList<CoautorInternoEvento> CoautorInternoEventos { get; private set; }

        public virtual int PosicionCoautor { get; set; }

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