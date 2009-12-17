using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class EstanciaInstitucionExternaService : IEstanciaInstitucionExternaService
    {
        readonly IRepository<EstanciaInstitucionExterna> estanciaInstitucionExternaRepository;

        public EstanciaInstitucionExternaService(IRepository<EstanciaInstitucionExterna> estanciaInstitucionExternaRepository)
        {
            this.estanciaInstitucionExternaRepository = estanciaInstitucionExternaRepository;
        }

        public EstanciaInstitucionExterna GetEstanciaInstitucionExternaById(int id)
        {
            return estanciaInstitucionExternaRepository.Get(id);
        }

        public EstanciaInstitucionExterna[] GetAllEstanciaInstitucionExternas()
        {
            return ((List<EstanciaInstitucionExterna>)estanciaInstitucionExternaRepository.GetAll()).ToArray();
        }
        
        public EstanciaInstitucionExterna[] GetActiveEstanciaInstitucionExternas()
        {
            return ((List<EstanciaInstitucionExterna>)estanciaInstitucionExternaRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveEstanciaInstitucionExterna(EstanciaInstitucionExterna estanciaInstitucionExterna)
        {
            if(estanciaInstitucionExterna.Id == 0)
            {
                estanciaInstitucionExterna.Activo = true;
                estanciaInstitucionExterna.CreadoEl = DateTime.Now;
            }
            estanciaInstitucionExterna.ModificadoEl = DateTime.Now;
            
            estanciaInstitucionExternaRepository.SaveOrUpdate(estanciaInstitucionExterna);
        }

	    public EstanciaInstitucionExterna[] GetAllEstanciaInstitucionExternas(Usuario usuario)
	    {
            return ((List<EstanciaInstitucionExterna>)estanciaInstitucionExternaRepository.FindAll(new Dictionary<string, object> { { "Usuario", usuario } })).ToArray();
	    }
    }
}