using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class CapituloService : ICapituloService
    {
        readonly IRepository<Capitulo> capituloRepository;

        public CapituloService(IRepository<Capitulo> capituloRepository)
        {
            this.capituloRepository = capituloRepository;
        }

        public Capitulo GetCapituloById(int id)
        {
            return capituloRepository.Get(id);
        }

        public Capitulo[] GetAllCapitulos()
        {
            return ((List<Capitulo>)capituloRepository.GetAll()).ToArray();
        }
        
        public Capitulo[] GetActiveCapitulos()
        {
            return ((List<Capitulo>)capituloRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveCapitulo(Capitulo capitulo)
        {
            if (capitulo.IsTransient())
            {
                capitulo.Puntuacion = 0;
                capitulo.Activo = true;
                capitulo.CreadorEl = DateTime.Now;
            }
            capitulo.ModificadoEl = DateTime.Now;
            
            capituloRepository.SaveOrUpdate(capitulo);
        }
    }
}
