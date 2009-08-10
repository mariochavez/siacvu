using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class ReporteService : IReporteService
    {
        readonly IRepository<Reporte> reporteRepository;

        public ReporteService(IRepository<Reporte> reporteRepository)
        {
            this.reporteRepository = reporteRepository;
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
                reporte.Activo = true;
                reporte.CreadorEl = DateTime.Now;
            }
            reporte.ModificadoEl = DateTime.Now;
            
            reporteRepository.SaveOrUpdate(reporte);
        }
    }
}
