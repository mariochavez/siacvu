using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class ParticipacionMedioService : IParticipacionMedioService
    {
        readonly IRepository<ParticipacionMedio> participacionMedioRepository;

        public ParticipacionMedioService(IRepository<ParticipacionMedio> participacionMedioRepository)
        {
            this.participacionMedioRepository = participacionMedioRepository;
        }

        public ParticipacionMedio GetParticipacionMedioById(int id)
        {
            return participacionMedioRepository.Get(id);
        }

        public ParticipacionMedio[] GetAllParticipacionMedios()
        {
            return ((List<ParticipacionMedio>)participacionMedioRepository.GetAll()).ToArray();
        }
        
        public ParticipacionMedio[] GetActiveParticipacionMedios()
        {
            return ((List<ParticipacionMedio>)participacionMedioRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveParticipacionMedio(ParticipacionMedio participacionMedio)
        {
            if(participacionMedio.Id == 0)
            {
                participacionMedio.Puntuacion = 0;
                participacionMedio.Activo = true;
                participacionMedio.CreadorEl = DateTime.Now;
            }
            participacionMedio.ModificadoEl = DateTime.Now;
            
            participacionMedioRepository.SaveOrUpdate(participacionMedio);
        }

	    public ParticipacionMedio[] GetAllParticipacionMedios(Usuario usuario)
	    {
            return ((List<ParticipacionMedio>)participacionMedioRepository.FindAll(new Dictionary<string, object> { { "Usuario", usuario } })).ToArray();
	    }
    }
}
