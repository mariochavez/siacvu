using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class LibroService : ILibroService
    {
        readonly IRepository<Libro> libroRepository;

        public LibroService(IRepository<Libro> libroRepository)
        {
            this.libroRepository = libroRepository;
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
            libro.ModificadoEl = DateTime.Now;
            
            libroRepository.SaveOrUpdate(libro);
        }
    }
}
