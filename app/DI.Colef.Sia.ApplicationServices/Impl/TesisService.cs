using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class TesisService : ITesisService
    {
        readonly IRepository<Tesis> tesisRepository;

        public TesisService(IRepository<Tesis> tesisRepository)
        {
            this.tesisRepository = tesisRepository;
        }

        public Tesis GetTesisById(int id)
        {
            return tesisRepository.Get(id);
        }

        public Tesis[] GetAllTesis()
        {
            return ((List<Tesis>)tesisRepository.GetAll()).ToArray();
        }
        
        public Tesis[] GetActiveTesis()
        {
            return ((List<Tesis>)tesisRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveTesis(Tesis tesis)
        {
            if(tesis.Id == 0)
            {
                tesis.Puntuacion = 0;
                tesis.Activo = true;
                tesis.CreadorEl = DateTime.Now;
            }
            tesis.ModificadoEl = DateTime.Now;
            
            tesisRepository.SaveOrUpdate(tesis);
        }
    }
}
