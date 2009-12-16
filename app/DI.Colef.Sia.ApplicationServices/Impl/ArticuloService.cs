using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class ArticuloService : IArticuloService
    {
        readonly IRepository<Articulo> articuloRepository;
        readonly IProductoQuerying productoQuerying;
        readonly IFirmaService firmaService;

        public ArticuloService(IRepository<Articulo> articuloRepository,
                               IProductoQuerying productoQuerying, IFirmaService firmaService)
        {
            this.articuloRepository = articuloRepository;
            this.productoQuerying = productoQuerying;
            this.firmaService = firmaService;
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
            SaveArticulo(articulo, false);
        }

        public void SaveArticulo(Articulo articulo, bool useCommit)
        {
            if (articulo.IsTransient())
            {
                articulo.Activo = true;
                articulo.CreadoEl = DateTime.Now;
                articulo.Puntuacion = 0;

                var firma = new Firma
                                {
                                    Aceptacion1 = 0,
                                    Aceptacion2 = 0,
                                    Aceptacion3 = 0,
                                    Firma1 = DateTime.Now,
                                    Firma2 = DateTime.Now,
                                    Firma3 = DateTime.Now,
                                    TipoProducto = articulo.TipoProducto,
                                    CreadoPor = articulo.Usuario,
                                    ModificadoPor = articulo.Usuario
                                };

                firmaService.SaveFirma(firma);

                articulo.Firma = firma;
            }

            articulo.ModificadoEl = DateTime.Now;

            articuloRepository.SaveOrUpdate(articulo);

            if (useCommit)
                articuloRepository.DbContext.CommitChanges();
        }

        public Articulo[] GetAllArticulos(Usuario usuario)
        {
            return productoQuerying.GetProductosByUsuario<Articulo>(usuario, "CoautorInternoArticulos");
        }
    }
}
