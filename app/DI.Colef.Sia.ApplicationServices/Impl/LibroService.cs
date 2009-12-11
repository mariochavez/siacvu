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
        readonly IProductoQuerying productoQuerying;
	    readonly IFirmaService firmaService;

        public LibroService(IRepository<Libro> libroRepository, IProductoQuerying productoQuerying, IFirmaService firmaService)
        {
            this.libroRepository = libroRepository;
            this.productoQuerying = productoQuerying;
            this.firmaService = firmaService;
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
            if(libro.IsTransient())
            {
                libro.Puntuacion = 0;
                libro.Activo = true;
                libro.CreadoEl = DateTime.Now;

                var firma = new Firma
                                {
                                    Aceptacion1 = 0,
                                    Aceptacion2 = 0,
                                    Aceptacion3 = 0,
                                    Firma1 = DateTime.Now,
                                    Firma2 = DateTime.Now,
                                    Firma3 = DateTime.Now,
                                    TipoProducto = libro.TipoProductoLibro,
                                    CreadoPor = libro.Usuario,
                                    ModificadoPor = libro.Usuario
                                };

                firmaService.SaveFirma(firma);

                libro.Firma = firma;
            }

            libro.ModificadoEl = DateTime.Now;
            
            libroRepository.SaveOrUpdate(libro);
        }

	    public Libro[] GetAllLibros(Usuario usuario)
	    {
            return productoQuerying.GetProductosByUsuario<Libro>(usuario, "CoautorInternoLibros");
	    }
    }
}