using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class ParticipacionAcademiaService : IParticipacionAcademiaService
    {
        readonly IRepository<ParticipacionAcademia> participacionAcademiaRepository;

        public ParticipacionAcademiaService(IRepository<ParticipacionAcademia> participacionAcademiaRepository)
        {
            this.participacionAcademiaRepository = participacionAcademiaRepository;
        }

        public ParticipacionAcademia GetParticipacionAcademiaById(int id)
        {
            return participacionAcademiaRepository.Get(id);
        }

        public ParticipacionAcademia[] GetAllParticipacionAcademias()
        {
            return ((List<ParticipacionAcademia>)participacionAcademiaRepository.GetAll()).ToArray();
        }
        
        public ParticipacionAcademia[] GetActiveParticipacionAcademias()
        {
            return ((List<ParticipacionAcademia>)participacionAcademiaRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveParticipacionAcademia(ParticipacionAcademia participacionAcademia)
        {
            if(participacionAcademia.Id == 0)
            {
                participacionAcademia.Activo = true;
                participacionAcademia.CreadoEl = DateTime.Now;
            }
            participacionAcademia.ModificadoEl = DateTime.Now;
            
            participacionAcademiaRepository.SaveOrUpdate(participacionAcademia);
        }

	    public ParticipacionAcademia[] GetAllParticipacionAcademias(Usuario usuario)
	    {
            return ((List<ParticipacionAcademia>)participacionAcademiaRepository.FindAll(new Dictionary<string, object> { { "Usuario", usuario } })).ToArray();
	    }
    }
}
