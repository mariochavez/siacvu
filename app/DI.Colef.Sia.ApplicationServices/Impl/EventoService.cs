using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class EventoService : IEventoService
    {
        readonly IRepository<Evento> eventoRepository;

        public EventoService(IRepository<Evento> eventoRepository)
        {
            this.eventoRepository = eventoRepository;
        }

        public Evento GetEventoById(int id)
        {
            return eventoRepository.Get(id);
        }

        public Evento[] GetAllEventos()
        {
            return ((List<Evento>)eventoRepository.GetAll()).ToArray();
        }
        
        public Evento[] GetActiveEventos()
        {
            return ((List<Evento>)eventoRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveEvento(Evento evento)
        {
            if(evento.Id == 0)
            {
                evento.Activo = true;
                evento.CreadorEl = DateTime.Now;
            }
            evento.ModificadoEl = DateTime.Now;
            
            eventoRepository.SaveOrUpdate(evento);
        }

	    public Evento[] GetAllEventos(Usuario usuario)
	    {
            return ((List<Evento>)eventoRepository.FindAll(new Dictionary<string, object> { { "Usuario", usuario } })).ToArray();
	    }
    }
}
