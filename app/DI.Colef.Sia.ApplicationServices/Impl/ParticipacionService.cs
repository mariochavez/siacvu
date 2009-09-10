using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class ParticipacionService : IParticipacionService
    {
        readonly IRepository<Participacion> participacionRepository;

        public ParticipacionService(IRepository<Participacion> participacionRepository)
        {
            this.participacionRepository = participacionRepository;
        }

        public Participacion GetParticipacionById(int id)
        {
            return participacionRepository.Get(id);
        }

        public Participacion[] GetAllParticipaciones()
        {
            return ((List<Participacion>)participacionRepository.GetAll()).ToArray();
        }
        
        public Participacion[] GetActiveParticipaciones()
        {
            return ((List<Participacion>)participacionRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveParticipacion(Participacion participacion)
        {
            if(participacion.Id == 0)
            {
                participacion.Puntuacion = 0;
                participacion.Activo = true;
                participacion.CreadorEl = DateTime.Now;
            }
            participacion.ModificadoEl = DateTime.Now;
            
            participacionRepository.SaveOrUpdate(participacion);
        }

	    public Participacion[] GetAllParticipaciones(Usuario usuario)
	    {
            return ((List<Participacion>)participacionRepository.FindAll(new Dictionary<string, object> { { "Usuario", usuario } })).ToArray();
	    }
    }
}
