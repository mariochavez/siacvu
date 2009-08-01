using System;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IPeriodoReferenciaService
    {
        PeriodoReferencia GetPeriodoReferenciaById(int id);
        PeriodoReferencia[] GetAllPeriodoReferencias();
        void SavePeriodoReferencia(PeriodoReferencia periodoReferencia);
    }
}
