using System;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class ProductoService : IProductoService
    {
        readonly IProductoQuerying productoQuerying;
        readonly IArticuloService articuloService;
        readonly ICapituloService capituloService;
        readonly ILibroService libroService;
        readonly IReporteService reporteService;
        readonly IResenaService resenaService;
        readonly IObraTraducidaService obraTraducidaService;

        public ProductoService(IProductoQuerying productoQuerying, IArticuloService articuloService, ICapituloService capituloService,
            ILibroService libroService, IReporteService reporteService, IResenaService resenaService, IObraTraducidaService obraTraducidaService)
        {
            this.productoQuerying = productoQuerying;
            this.articuloService = articuloService;
            this.capituloService = capituloService;
            this.libroService = libroService;
            this.reporteService = reporteService;
            this.resenaService = resenaService;
            this.obraTraducidaService = obraTraducidaService;
        }

        public object[] GetProductosBandeja(Usuario usuario)
        {
            return productoQuerying.GetProductosBandeja(usuario);
        }

        public string SignAndGetNombreProducto(int id, int tipoProducto, Usuario usuario)
        {
            var nombreProducto = "";

            switch (tipoProducto)
            {
                case 1:
                    var articulo = articuloService.GetArticuloById(id);
                    articulo.Firma.Aceptacion1 = 1;
                    articulo.Firma.Firma1 = DateTime.Now;
                    articulo.ModificadoEl = DateTime.Now;
                    articulo.ModificadoPor = usuario;
                    nombreProducto = articulo.Titulo;
                    break;
                case 2:
                    var capitulo = capituloService.GetCapituloById(id);
                    capitulo.Firma.Aceptacion1 = 1;
                    capitulo.Firma.Firma1 = DateTime.Now;
                    capitulo.ModificadoEl = DateTime.Now;
                    capitulo.ModificadoPor = usuario;
                    nombreProducto = capitulo.NombreCapitulo;
                    break;
                case 7:
                    var libro = libroService.GetLibroById(id);
                    libro.Firma.Aceptacion1 = 1;
                    libro.Firma.Firma1 = DateTime.Now;
                    libro.ModificadoEl = DateTime.Now;
                    libro.ModificadoPor = usuario;
                    nombreProducto = libro.Nombre;
                    break;
            }

            return nombreProducto;
        }
    }
}