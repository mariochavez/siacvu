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
        readonly IRepository<Idioma> idiomaRepository;
        readonly IProductoQuerying productoQuerying;

        public CapituloService(IRepository<Capitulo> capituloRepository, IRepository<Idioma> idiomaRepository,
                               IProductoQuerying productoQuerying)
        {
            this.capituloRepository = capituloRepository;
            this.idiomaRepository = idiomaRepository;
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
                capitulo.CreadorEl = DateTime.Now;
            }

            if (capitulo.Idioma == null && capitulo.TipoCapitulo != null)
            {
                var idioma = new Dictionary<string, object> { { "Nombre", "Español" } };

                capitulo.Idioma = idiomaRepository.FindOne(idioma);
            }

            capitulo.ModificadoEl = DateTime.Now;
            
            capituloRepository.SaveOrUpdate(capitulo);
        }

	    public Capitulo[] GetAllCapitulos(Usuario usuario)
	    {
            return productoQuerying.GetProductosByUsuario<Capitulo>(usuario, "CoautorInternoCapitulos");
	    }
    }
}
