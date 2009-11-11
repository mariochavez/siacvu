using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class ResenaService : IResenaService
    {
        readonly IRepository<Resena> resenaRepository;
        readonly IProductoQuerying productoQuerying;

        public ResenaService(IRepository<Resena> resenaRepository, IProductoQuerying productoQuerying)
        {
            this.resenaRepository = resenaRepository;
            this.productoQuerying = productoQuerying;
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
            return productoQuerying.GetProductosByUsuario<Resena>(usuario, "CoautorInternoResenas");
	    }
    }
}
