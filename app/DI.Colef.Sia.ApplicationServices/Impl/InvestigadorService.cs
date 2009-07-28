using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class InvestigadorService : IInvestigadorService
    {
        readonly IRepository<Investigador> investigadorRepository;

        public InvestigadorService(IRepository<Investigador> investigadorRepository)
        {
            this.investigadorRepository = investigadorRepository;
        }

        public Investigador GetInvestigadorById(int id)
        {
            return investigadorRepository.Get(id);
        }

        public Investigador[] GetAllInvestigadors()
        {
            return ((List<Investigador>) investigadorRepository.GetAll()).ToArray();
        }

        public void SaveInvestigador(Investigador investigador)
        {
            if(investigador.Id == 0)
            {
                investigador.Activo = true;
                investigador.CreadorEl = DateTime.Now;
            }
            investigador.ModificadoEl = DateTime.Now;
            
            investigadorRepository.SaveOrUpdate(investigador);
        }
    }
}
