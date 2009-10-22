using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class ArticuloService : IArticuloService
    {
        readonly IRepository<Articulo> articuloRepository;
        readonly IRepository<Idioma> idiomaRepository;

        public ArticuloService(IRepository<Articulo> articuloRepository, IRepository<Idioma> idiomaRepository)
        {
            this.articuloRepository = articuloRepository;
            this.idiomaRepository = idiomaRepository;
        }

        public Articulo GetArticuloById(int id)
        {
            return articuloRepository.Get(id);
        }

        public Articulo[] GetAllArticulos()
        {
            return ((List<Articulo>)articuloRepository.GetAll()).ToArray();
        }

        public Articulo[] GetActiveArticulos()
        {
            return ((List<Articulo>)articuloRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveArticulo(Articulo articulo)
        {
            if (articulo.IsTransient())
            {
                articulo.Activo = true;
                articulo.CreadorEl = DateTime.Now;
                articulo.Puntuacion = 0;
            }

            if(articulo.Idioma == null && articulo.TipoArticulo != null)
            {
                var idioma = new Dictionary<string, object> { { "Nombre", "Español" } };

                articulo.Idioma = idiomaRepository.FindOne(idioma);
            }

            articulo.ModificadoEl = DateTime.Now;

            articuloRepository.SaveOrUpdate(articulo);
        }

        public Articulo[] GetAllArticulos(Usuario usuario)
        {
            return ((List<Articulo>)articuloRepository.FindAll(new Dictionary<string, object> { { "Usuario", usuario } })).ToArray();
        }
    }
}
