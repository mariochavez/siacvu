using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class ArticuloService : IArticuloService
    {
        readonly IRepository<Articulo> articuloRepository;

        public ArticuloService(IRepository<Articulo> articuloRepository)
        {
            this.articuloRepository = articuloRepository;
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
            }
            articulo.ModificadoEl = DateTime.Now;

            articuloRepository.SaveOrUpdate(articulo);
        }
    }
}
