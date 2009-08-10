using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class ReseñaService : IReseñaService
    {
        readonly IRepository<Reseña> reseñaRepository;

        public ReseñaService(IRepository<Reseña> reseñaRepository)
        {
            this.reseñaRepository = reseñaRepository;
        }

        public Reseña GetReseñaById(int id)
        {
            return reseñaRepository.Get(id);
        }

        public Reseña[] GetAllReseñas()
        {
            return ((List<Reseña>)reseñaRepository.GetAll()).ToArray();
        }
        
        public Reseña[] GetActiveReseñas()
        {
            return ((List<Reseña>)reseñaRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveReseña(Reseña reseña)
        {
            if(reseña.Id == 0)
            {
                reseña.Puntuacion = 0;
                reseña.Activo = true;
                reseña.CreadorEl = DateTime.Now;
            }
            reseña.ModificadoEl = DateTime.Now;
            
            reseñaRepository.SaveOrUpdate(reseña);
        }
    }
}
