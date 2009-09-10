using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class ResenaService : IResenaService
    {
        readonly IRepository<Resena> resenaRepository;

        public ResenaService(IRepository<Resena> resenaRepository)
        {
            this.resenaRepository = resenaRepository;
        }

        public Resena GetResenaById(int id)
        {
            return resenaRepository.Get(id);
        }

        public Resena[] GetAllResenas()
        {
            return ((List<Resena>)resenaRepository.GetAll()).ToArray();
        }
        
        public Resena[] GetActiveResenas()
        {
            return ((List<Resena>)resenaRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveResena(Resena resena)
        {
            if(resena.Id == 0)
            {
                resena.Puntuacion = 0;
                resena.Activo = true;
                resena.CreadorEl = DateTime.Now;
            }
            resena.ModificadoEl = DateTime.Now;
            
            resenaRepository.SaveOrUpdate(resena);
        }

	    public Resena[] GetAllResenas(Usuario usuario)
	    {
            return ((List<Resena>)resenaRepository.FindAll(new Dictionary<string, object> { { "Usuario", usuario } })).ToArray();
	    }
    }
}
