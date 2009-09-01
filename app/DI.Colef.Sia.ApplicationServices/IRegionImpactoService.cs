using System;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IRegionImpactoService
    {
        RegionImpacto GetRegionImpactoById(int id);
        RegionImpacto[] GetAllRegionImpactos();
        RegionImpacto[] GetActiveRegionImpactos();
        void SaveRegionImpacto(RegionImpacto regionImpacto);
    }
}
