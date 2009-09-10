using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class ApoyoConacytService : IApoyoConacytService
    {
        readonly IRepository<ApoyoConacyt> apoyoConacytRepository;

        public ApoyoConacytService(IRepository<ApoyoConacyt> apoyoConacytRepository)
        {
            this.apoyoConacytRepository = apoyoConacytRepository;
        }

        public ApoyoConacyt GetApoyoConacytById(int id)
        {
            return apoyoConacytRepository.Get(id);
        }

        public ApoyoConacyt[] GetAllApoyosConacyt()
        {
            return ((List<ApoyoConacyt>)apoyoConacytRepository.GetAll()).ToArray();
        }
        
        public ApoyoConacyt[] GetActiveApoyosConacyt()
        {
            return ((List<ApoyoConacyt>)apoyoConacytRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveApoyoConacyt(ApoyoConacyt apoyoConacyt)
        {
            if(apoyoConacyt.Id == 0)
            {
                apoyoConacyt.Activo = true;
                apoyoConacyt.CreadorEl = DateTime.Now;
            }
            apoyoConacyt.ModificadoEl = DateTime.Now;
            
            apoyoConacytRepository.SaveOrUpdate(apoyoConacyt);
        }

	    public ApoyoConacyt[] GetAllApoyosConacyt(Usuario usuario)
	    {
            return ((List<ApoyoConacyt>)apoyoConacytRepository.FindAll(new Dictionary<string, object> { { "Usuario", usuario } })).ToArray();
	    }
    }
}
