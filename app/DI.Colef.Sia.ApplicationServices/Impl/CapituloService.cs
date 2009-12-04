using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class CapituloService : ICapituloService
    {
        readonly IRepository<Capitulo> capituloRepository;
        readonly IProductoQuerying productoQuerying;

        public CapituloService(IRepository<Capitulo> capituloRepository,
                               IProductoQuerying productoQuerying)
        {
            this.capituloRepository = capituloRepository;
            this.productoQuerying = productoQuerying;
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
                capitulo.CreadoEl = DateTime.Now;
            }

            capitulo.PosicionAutor = 1;
            capitulo.ModificadoEl = DateTime.Now;
            
            capituloRepository.SaveOrUpdate(capitulo);
        }

	    public Capitulo[] GetAllCapitulos(Usuario usuario)
	    {
            return productoQuerying.GetProductosByUsuario<Capitulo>(usuario, "CoautorInternoCapitulos");
	    }
    }
}