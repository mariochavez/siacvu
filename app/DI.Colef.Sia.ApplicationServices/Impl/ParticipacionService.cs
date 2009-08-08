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

        public Participacion[] GetAllParticipacions()
        {
            return null;
			//return ((List<Participacion>)OrderCatalog<Participacion>()).ToArray();
        }
        
        public Participacion[] GetActiveParticipacions()
        {
            return ((List<Participacion>)participacionRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveParticipacion(Participacion participacion)
        {
            if(participacion.Id == 0)
            {
                participacion.Activo = true;
                participacion.CreadorEl = DateTime.Now;
            }
            participacion.ModificadoEl = DateTime.Now;
            
            participacionRepository.SaveOrUpdate(participacion);
        }
    }
}
