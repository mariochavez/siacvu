using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class TesisDirigidaService : ITesisDirigidaService
    {
        readonly IRepository<TesisDirigida> tesisDirigidaRepository;

        public TesisDirigidaService(IRepository<TesisDirigida> tesisDirigidaRepository)
        {
            this.tesisDirigidaRepository = tesisDirigidaRepository;
        }

        public TesisDirigida GetTesisDirigidaById(int id)
        {
            return tesisDirigidaRepository.Get(id);
        }

        public TesisDirigida[] GetAllTesisDirigidas()
        {
            return ((List<TesisDirigida>)tesisDirigidaRepository.GetAll()).ToArray();
        }
        
        public TesisDirigida[] GetActiveTesisDirigidas()
        {
            return ((List<TesisDirigida>)tesisDirigidaRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveTesisDirigida(TesisDirigida tesisDirigida)
        {
            if(tesisDirigida.Id == 0)
            {
                tesisDirigida.Puntuacion = 0;
                tesisDirigida.Activo = true;
                tesisDirigida.CreadorEl = DateTime.Now;
            }
            tesisDirigida.ModificadoEl = DateTime.Now;
            
            tesisDirigidaRepository.SaveOrUpdate(tesisDirigida);
        }

	    public TesisDirigida[] GetAllTesisDirigidas(Usuario usuario)
	    {
            return ((List<TesisDirigida>)tesisDirigidaRepository.FindAll(new Dictionary<string, object> { { "Usuario", usuario } })).ToArray();
	    }
    }
}
