using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class DictamenService : IDictamenService
    {
        readonly IRepository<Dictamen> dictamenRepository;

        public DictamenService(IRepository<Dictamen> dictamenRepository)
        {
            this.dictamenRepository = dictamenRepository;
        }

        public Dictamen GetDictamenById(int id)
        {
            return dictamenRepository.Get(id);
        }

        public Dictamen[] GetAllDictamenes()
        {
            return ((List<Dictamen>)dictamenRepository.GetAll()).ToArray();
        }
        
        public Dictamen[] GetActiveDictamenes()
        {
            return ((List<Dictamen>)dictamenRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveDictamen(Dictamen dictamen)
        {
            if(dictamen.Id == 0)
            {
                dictamen.Puntuacion = 0;
                dictamen.Activo = true;
                dictamen.CreadoEl = DateTime.Now;
            }
            dictamen.ModificadoEl = DateTime.Now;
            
            dictamenRepository.SaveOrUpdate(dictamen);
        }

	    public Dictamen[] GetAllDictamenes(Usuario usuario)
	    {
            return ((List<Dictamen>)dictamenRepository.FindAll(new Dictionary<string, object> { { "Usuario", usuario } })).ToArray();
	    }
    }
}
