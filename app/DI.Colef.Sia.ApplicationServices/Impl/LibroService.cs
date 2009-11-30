using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class LibroService : ILibroService
    {
        readonly IRepository<Libro> libroRepository;
        readonly IRepository<Idioma> idiomaRepository;
        readonly IProductoQuerying productoQuerying;

        public LibroService(IRepository<Libro> libroRepository, IRepository<Idioma> idiomaRepository, IProductoQuerying productoQuerying)
        {
            this.libroRepository = libroRepository;
            this.idiomaRepository = idiomaRepository;
            this.productoQuerying = productoQuerying;
        }

        public Libro GetLibroById(int id)
        {
            return libroRepository.Get(id);
        }

        public Libro[] GetAllLibros()
        {
			return ((List<Libro>)libroRepository.GetAll()).ToArray();
        }
        
        public Libro[] GetActiveLibros()
        {
            return ((List<Libro>)libroRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveLibro(Libro libro)
        {
            if(libro.Id == 0)
            {
                libro.Puntuacion = 0;
                libro.Activo = true;
                libro.CreadorEl = DateTime.Now;
            }

            libro.PosicionAutor = 1;
            libro.ModificadoEl = DateTime.Now;
            
            libroRepository.SaveOrUpdate(libro);
        }

	    public Libro[] GetAllLibros(Usuario usuario)
	    {
            return productoQuerying.GetProductosByUsuario<Libro>(usuario, "CoautorInternoLibros");
	    }
    }
}