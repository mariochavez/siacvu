using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class DistincionService : IDistincionService
    {
        readonly IRepository<Distincion> distincionRepository;

        public DistincionService(IRepository<Distincion> distincionRepository)
        {
            this.distincionRepository = distincionRepository;
        }

        public Distincion GetDistincionById(int id)
        {
            return distincionRepository.Get(id);
        }

        public Distincion[] GetAllDistinciones()
        {
            return ((List<Distincion>)distincionRepository.GetAll()).ToArray();
        }
        
        public Distincion[] GetActiveDistinciones()
        {
            return ((List<Distincion>)distincionRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveDistincion(Distincion distincion)
        {
            if(distincion.Id == 0)
            {
                distincion.Activo = true;
                distincion.CreadorEl = DateTime.Now;
            }
            distincion.ModificadoEl = DateTime.Now;
            
            distincionRepository.SaveOrUpdate(distincion);
        }
    }
}
