using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using System.Collections.Generic;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class Evento : Entity, IBaseEntity
    {
        public Evento()
        {
            TipoParticipacionEventos = new List<TipoParticipacionEvento>();
            CoautorExternoEventos = new List<CoautorExternoEvento>();
            CoautorInternoEventos = new List<CoautorInternoEvento>();
        }

        public virtual void AddTipo(TipoParticipacionEvento tipoParticipacionEvento)
        {
            TipoParticipacionEventos.Add(tipoParticipacionEvento);
        }

        public virtual void AddCoautorExterno(CoautorExternoEvento coautorExternoEvento)
        {
            CoautorExternoEventos.Add(coautorExternoEvento);
        }

        public virtual void AddCoautorInterno(CoautorInternoEvento coautorInternoEvento)
        {
            CoautorInternoEventos.Add(coautorInternoEvento);
        }


        [NotNullNotEmpty]
        public virtual string Nombre { get; set; }

        public virtual Ambito Ambito { get; set; }

        public virtual TipoEvento TipoEvento { get; set; }

        [Valid]
        public virtual IList<TipoParticipacionEvento> TipoParticipacionEventos { get; private set; }

        public virtual string Titulo { get; set; }

        public virtual bool Invitacion { get; set; }

        [Valid]
        public virtual IList<CoautorExternoEvento> CoautorExternoEventos { get; private set; }

        [Valid]
        public virtual IList<CoautorInternoEvento> CoautorInternoEventos { get; private set; }

        public virtual Institucion Institucion { get; set; }

        public virtual string Lugar { get; set; }

        public virtual LineaTematica LineaTematica { get; set; }

        public virtual DateTime FechaInicial { get; set; }

        public virtual DateTime FechaFinal { get; set; }

        public virtual TipoFinanciamiento TipoFinanciamiento { get; set; }

        [NotNull]
        public virtual Investigador Investigador { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}
