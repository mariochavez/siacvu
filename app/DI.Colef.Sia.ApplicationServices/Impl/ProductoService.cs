using System;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class ProductoService : IProductoService
    {
        readonly IProductoQuerying productoQuerying;
        readonly IArticuloService articuloService;
        readonly IArticuloDifusionService articuloDifusionService;
        readonly ICapituloService capituloService;
        readonly ILibroService libroService;
        readonly IReporteService reporteService;
        readonly IResenaService resenaService;
        readonly IObraTraducidaService obraTraducidaService;
        readonly IProyectoService proyectoService;
        readonly ICursoService cursoService;
        readonly ITesisDirigidaService tesisDirigidaService;
        readonly IDictamenService dictamenService;
        readonly IOrganoExternoService organoExternoService;
        readonly IEventoService eventoService;
        readonly IParticipacionMedioService participacionMedioService;

        public ProductoService(IProductoQuerying productoQuerying, IArticuloService articuloService, ICapituloService capituloService,
            ILibroService libroService, IReporteService reporteService, IResenaService resenaService, IObraTraducidaService obraTraducidaService,
            IProyectoService proyectoService, ICursoService cursoService, ITesisDirigidaService tesisDirigidaService, IDictamenService dictamenService,
            IOrganoExternoService organoExternoService, IEventoService eventoService, IParticipacionMedioService participacionMedioService,
            IArticuloDifusionService articuloDifusionService)
        {
            this.productoQuerying = productoQuerying;
            this.articuloService = articuloService;
            this.articuloDifusionService = articuloDifusionService;
            this.capituloService = capituloService;
            this.libroService = libroService;
            this.reporteService = reporteService;
            this.resenaService = resenaService;
            this.obraTraducidaService = obraTraducidaService;
            this.proyectoService = proyectoService;
            this.cursoService = cursoService;
            this.tesisDirigidaService = tesisDirigidaService;
            this.dictamenService = dictamenService;
            this.organoExternoService = organoExternoService;
            this.eventoService = eventoService;
            this.participacionMedioService = participacionMedioService;
        }

        public object[] GetProductosBandeja(Usuario usuario)
        {
            return productoQuerying.GetProductosBandeja(usuario);
        }

        public object[] GetProductosBandeja(bool isDgaa)
        {
            return productoQuerying.GetProductosBandeja(isDgaa);
        }

        public object[] GetProductosBandeja(bool isDgaa, int filterId, int filterType)
        {
            return productoQuerying.GetProductosBandeja(isDgaa, filterId, filterType);
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
                    articulo.Firma.Usuario1 = usuario;
                    articulo.ModificadoEl = DateTime.Now;
                    articulo.ModificadoPor = usuario;
                    nombreProducto = articulo.Titulo;
                    break;
                case 2:
                    var capitulo = capituloService.GetCapituloById(id);
                    capitulo.Firma.Aceptacion1 = 1;
                    capitulo.Firma.Firma1 = DateTime.Now;
                    capitulo.Firma.Usuario1 = usuario;
                    capitulo.ModificadoEl = DateTime.Now;
                    capitulo.ModificadoPor = usuario;
                    nombreProducto = capitulo.NombreCapitulo;
                    break;
                case 3:
                    var curso = cursoService.GetCursoById(id);
                    curso.Firma.Aceptacion1 = 1;
                    curso.Firma.Firma1 = DateTime.Now;
                    curso.Firma.Usuario1 = usuario;
                    curso.ModificadoEl = DateTime.Now;
                    curso.ModificadoPor = usuario;
                    nombreProducto = curso.Nombre;
                    break;
                case 4:
                    var dictamen = dictamenService.GetDictamenById(id);
                    dictamen.Firma.Aceptacion1 = 1;
                    dictamen.Firma.Firma1 = DateTime.Now;
                    dictamen.Firma.Usuario1 = usuario;
                    dictamen.ModificadoEl = DateTime.Now;
                    dictamen.ModificadoPor = usuario;
                    nombreProducto = dictamen.Nombre;
                    break;
                case 6:
                    var evento = eventoService.GetEventoById(id);
                    evento.Firma.Aceptacion1 = 1;
                    evento.Firma.Firma1 = DateTime.Now;
                    evento.Firma.Usuario1 = usuario;
                    evento.ModificadoEl = DateTime.Now;
                    evento.ModificadoPor = usuario;
                    nombreProducto = evento.Nombre;
                    break;
                case 7:
                    var libro = libroService.GetLibroById(id);
                    libro.Firma.Aceptacion1 = 1;
                    libro.Firma.Firma1 = DateTime.Now;
                    libro.Firma.Usuario1 = usuario;
                    libro.ModificadoEl = DateTime.Now;
                    libro.ModificadoPor = usuario;
                    nombreProducto = libro.Nombre;
                    break;
                case 8:
                    var organoExterno = organoExternoService.GetOrganoExternoById(id);
                    organoExterno.Firma.Aceptacion1 = 1;
                    organoExterno.Firma.Firma1 = DateTime.Now;
                    organoExterno.Firma.Usuario1 = usuario;
                    organoExterno.ModificadoEl = DateTime.Now;
                    organoExterno.ModificadoPor = usuario;
                    nombreProducto = organoExterno.Nombre;
                    break;
                case 10:
                    var participacionMedio = participacionMedioService.GetParticipacionMedioById(id);
                    participacionMedio.Firma.Aceptacion1 = 1;
                    participacionMedio.Firma.Firma1 = DateTime.Now;
                    participacionMedio.Firma.Usuario1 = usuario;
                    participacionMedio.ModificadoEl = DateTime.Now;
                    participacionMedio.ModificadoPor = usuario;
                    nombreProducto = participacionMedio.Titulo;
                    break;
                case 11:
                    var reporte = reporteService.GetReporteById(id);
                    reporte.Firma.Aceptacion1 = 1;
                    reporte.Firma.Firma1 = DateTime.Now;
                    reporte.Firma.Usuario1 = usuario;
                    reporte.ModificadoEl = DateTime.Now;
                    reporte.ModificadoPor = usuario;
                    nombreProducto = reporte.Titulo;
                    break;
                case 12:
                    var resena = resenaService.GetResenaById(id);
                    resena.Firma.Aceptacion1 = 1;
                    resena.Firma.Firma1 = DateTime.Now;
                    resena.Firma.Usuario1 = usuario;
                    resena.ModificadoEl = DateTime.Now;
                    resena.ModificadoPor = usuario;
                    nombreProducto = resena.NombreProducto;
                    break;
                case 13:
                    var tesisDirigida = tesisDirigidaService.GetTesisDirigidaById(id);
                    tesisDirigida.Firma.Aceptacion1 = 1;
                    tesisDirigida.Firma.Firma1 = DateTime.Now;
                    tesisDirigida.Firma.Usuario1 = usuario;
                    tesisDirigida.ModificadoEl = DateTime.Now;
                    tesisDirigida.ModificadoPor = usuario;
                    nombreProducto = tesisDirigida.Titulo;
                    break;
                case 15:
                    var proyecto = proyectoService.GetProyectoById(id);
                    proyecto.Firma.Aceptacion1 = 1;
                    proyecto.Firma.Firma1 = DateTime.Now;
                    proyecto.Firma.Usuario1 = usuario;
                    proyecto.ModificadoEl = DateTime.Now;
                    proyecto.ModificadoPor = usuario;
                    nombreProducto = proyecto.Nombre;
                    break;
                case 16:
                    var articuloDifusion = articuloDifusionService.GetArticuloById(id);
                    articuloDifusion.Firma.Aceptacion1 = 1;
                    articuloDifusion.Firma.Firma1 = DateTime.Now;
                    articuloDifusion.Firma.Usuario1 = usuario;
                    articuloDifusion.ModificadoEl = DateTime.Now;
                    articuloDifusion.ModificadoPor = usuario;
                    nombreProducto = articuloDifusion.Titulo;
                    break;
                case 20:
                    var obraTraducida = obraTraducidaService.GetObraTraducidaById(id);
                    obraTraducida.Firma.Aceptacion1 = 1;
                    obraTraducida.Firma.Firma1 = DateTime.Now;
                    obraTraducida.Firma.Usuario1 = usuario;
                    obraTraducida.ModificadoEl = DateTime.Now;
                    obraTraducida.ModificadoPor = usuario;
                    nombreProducto = obraTraducida.Nombre;
                    break;
            }

            return nombreProducto;
        }
    }
}