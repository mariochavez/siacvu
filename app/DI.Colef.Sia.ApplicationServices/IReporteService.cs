using System;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IReporteService
    {
        Reporte GetReporteById(int id);
        Reporte[] GetAllReportes();
        Reporte[] GetActiveReportes();
        void SaveReporte(Reporte reporte);
    }
}
