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
            SaveDistincion(distincion, false);
        }

        public void SaveDistincion(Distincion distincion, bool commit)
        {
            if(distincion.Id == 0)
            {
                distincion.Activo = true;
                distincion.CreadoEl = DateTime.Now;
            }
            distincion.ModificadoEl = DateTime.Now;
            
            distincionRepository.SaveOrUpdate(distincion);
            
            if (commit)
                distincionRepository.DbContext.CommitChanges();
        }

	    public Distincion[] GetAllDistinciones(Usuario usuario)
	    {
            return ((List<Distincion>)distincionRepository.FindAll(new Dictionary<string, object> { { "Usuario", usuario } })).ToArray();
	    }
    }
}
