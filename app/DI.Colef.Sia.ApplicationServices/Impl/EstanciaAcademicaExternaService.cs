using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class EstanciaAcademicaExternaService : IEstanciaAcademicaExternaService
    {
        readonly IRepository<EstanciaAcademicaExterna> estanciaAcademicaExternaRepository;

        public EstanciaAcademicaExternaService(IRepository<EstanciaAcademicaExterna> estanciaAcademicaExternaRepository)
        {
            this.estanciaAcademicaExternaRepository = estanciaAcademicaExternaRepository;
        }

        public EstanciaAcademicaExterna GetEstanciaAcademicaExternaById(int id)
        {
            return estanciaAcademicaExternaRepository.Get(id);
        }

        public EstanciaAcademicaExterna[] GetAllEstanciaAcademicaExternas()
        {
            return ((List<EstanciaAcademicaExterna>)estanciaAcademicaExternaRepository.GetAll()).ToArray();
        }
        
        public EstanciaAcademicaExterna[] GetActiveEstanciaAcademicaExternas()
        {
            return ((List<EstanciaAcademicaExterna>)estanciaAcademicaExternaRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveEstanciaAcademicaExterna(EstanciaAcademicaExterna estanciaAcademicaExterna)
        {
            if(estanciaAcademicaExterna.Id == 0)
            {
                estanciaAcademicaExterna.Activo = true;
                estanciaAcademicaExterna.CreadorEl = DateTime.Now;
            }
            estanciaAcademicaExterna.ModificadoEl = DateTime.Now;
            
            estanciaAcademicaExternaRepository.SaveOrUpdate(estanciaAcademicaExterna);
        }

        public EstanciaAcademicaExterna[] GetAllEstanciaAcademicaExternas(Usuario usuario)
        {
            return ((List<EstanciaAcademicaExterna>)estanciaAcademicaExternaRepository.FindAll(new Dictionary<string, object> { { "Usuario", usuario } })).ToArray();
        }
    }
}