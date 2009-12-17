using System;
using System.Collections.Generic;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class SesionEvento : Entity, IBaseEntity, IParticipante
    {
        const int tipoProducto = 6; // 6 Representa Evento

        public SesionEvento()
        {
            ParticipanteExternoEventos = new List<ParticipanteExternoEvento>();
            ParticipanteInternoEventos = new List<ParticipanteInternoEvento>();
        }

        public virtual void AddParticipanteExterno(ParticipanteExternoProducto participanteExterno)
        {
            participanteExterno.TipoProducto = tipoProducto;
            ParticipanteExternoEventos.Add((ParticipanteExternoEvento) participanteExterno);
        }

        public virtual void AddParticipanteInterno(ParticipanteInternoProducto participanteInterno)
        {
            participanteInterno.TipoProducto = tipoProducto;
            ParticipanteInternoEventos.Add((ParticipanteInternoEvento) participanteInterno);
        }

        public virtual void DeleteParticipanteInterno(ParticipanteInternoProducto participanteInterno)
        {
            ParticipanteInternoEventos.Remove((ParticipanteInternoEvento) participanteInterno);
        }

        public virtual void DeleteParticipanteExterno(ParticipanteExternoProducto participanteExterno)
        {
            ParticipanteExternoEventos.Remove((ParticipanteExternoEvento) participanteExterno);
        }

        [NotNullNotEmpty]
        public virtual string NombreSesion { get; set; }

        public virtual string ObjetivoSesion { get; set; }
        
        public virtual Ambito Ambito { get; set; }

        public virtual DateTime FechaEvento { get; set; }

        public virtual string Lugar { get; set; }

        public virtual string Logros { get; set; }

        [Valid]
        public virtual IList<ParticipanteExternoEvento> ParticipanteExternoEventos { get; private set; }

        [Valid]
        public virtual IList<ParticipanteInternoEvento> ParticipanteInternoEventos { get; private set; }

        public virtual Usuario CreadoPor { get; set; }

        public virtual DateTime CreadoEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}