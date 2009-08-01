using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class RevistaPublicacionService : IRevistaPublicacionService
    {
        readonly IRepository<RevistaPublicacion> revistaPublicacionRepository;

        public RevistaPublicacionService(IRepository<RevistaPublicacion> revistaPublicacionRepository)
        {
            this.revistaPublicacionRepository = revistaPublicacionRepository;
        }

        public RevistaPublicacion GetRevistaPublicacionById(int id)
        {
            return revistaPublicacionRepository.Get(id);
        }

        public RevistaPublicacion[] GetAllRevistaPublicacions()
        {
            return ((List<RevistaPublicacion>) revistaPublicacionRepository.GetAll()).ToArray();
        }

        public void SaveRevistaPublicacion(RevistaPublicacion revistaPublicacion)
        {
            if(revistaPublicacion.Id == 0)
            {
                revistaPublicacion.Activo = true;
                revistaPublicacion.CreadorEl = DateTime.Now;
            }
            revistaPublicacion.ModificadoEl = DateTime.Now;
            
            revistaPublicacionRepository.SaveOrUpdate(revistaPublicacion);
        }
    }
}
