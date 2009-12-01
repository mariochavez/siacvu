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

        public ReporteService(IRepository<Reporte> reporteRepository, IProductoQuerying productoQuerying)
        {
            this.reporteRepository = reporteRepository;
            this.productoQuerying = productoQuerying;
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
            if(reporte.Id == 0)
            {
                reporte.Puntuacion = 0;
                reporte.Activo = true;
                reporte.CreadorEl = DateTime.Now;
            }

            reporte.PosicionAutor = 1;
            reporte.ModificadoEl = DateTime.Now;
            
            reporteRepository.SaveOrUpdate(reporte);
        }

	    public Reporte[] GetAllReportes(Usuario usuario)
	    {
            return productoQuerying.GetProductosByUsuario<Reporte>(usuario, "CoautorInternoReportes");
	    }
    }
}
