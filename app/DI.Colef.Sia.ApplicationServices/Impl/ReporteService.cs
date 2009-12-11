using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class ReporteService : IReporteService
    {
        readonly IRepository<Reporte> reporteRepository;
        readonly IProductoQuerying productoQuerying;
	    readonly IFirmaService firmaService;

        public ReporteService(IRepository<Reporte> reporteRepository, IProductoQuerying productoQuerying, IFirmaService firmaService)
        {
            this.reporteRepository = reporteRepository;
            this.productoQuerying = productoQuerying;
            this.firmaService = firmaService;
        }

        public Reporte GetReporteById(int id)
        {
            return reporteRepository.Get(id);
        }

        public Reporte[] GetAllReportes()
        {
            return ((List<Reporte>)reporteRepository.GetAll()).ToArray();
        }
        
        public Reporte[] GetActiveReportes()
        {
            return ((List<Reporte>)reporteRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveReporte(Reporte reporte)
        {
            if (reporte.IsTransient())
            {
                reporte.Puntuacion = 0;
                reporte.Activo = true;
                reporte.CreadoEl = DateTime.Now;

                var firma = new Firma
                                {
                                    Aceptacion1 = 0,
                                    Aceptacion2 = 0,
                                    Aceptacion3 = 0,
                                    Firma1 = DateTime.Now,
                                    Firma2 = DateTime.Now,
                                    Firma3 = DateTime.Now,
                                    TipoProducto = reporte.TipoProducto,
                                    CreadoPor = reporte.Usuario,
                                    ModificadoPor = reporte.Usuario
                                };

                firmaService.SaveFirma(firma);

                reporte.Firma = firma;
            }

            reporte.ModificadoEl = DateTime.Now;
            
            reporteRepository.SaveOrUpdate(reporte);
        }

	    public Reporte[] GetAllReportes(Usuario usuario)
	    {
            return productoQuerying.GetProductosByUsuario<Reporte>(usuario, "CoautorInternoReportes");
	    }
    }
}
