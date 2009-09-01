using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class RegionImpactoService : IRegionImpactoService
    {
        readonly IRepository<RegionImpacto> regionImpactoRepository;

        public RegionImpactoService(IRepository<RegionImpacto> regionImpactoRepository)
        {
            this.regionImpactoRepository = regionImpactoRepository;
        }

        public RegionImpacto GetRegionImpactoById(int id)
        {
            return regionImpactoRepository.Get(id);
        }

        public RegionImpacto[] GetAllRegionImpactos()
        {
			return ((List<RegionImpacto>)OrderCatalog<RegionImpacto>()).ToArray();
        }
        
        public RegionImpacto[] GetActiveRegionImpactos()
        {
            return ((List<RegionImpacto>)regionImpactoRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveRegionImpacto(RegionImpacto regionImpacto)
        {
            if(regionImpacto.Id == 0)
            {
                regionImpacto.Activo = true;
                regionImpacto.CreadorEl = DateTime.Now;
            }
            regionImpacto.ModificadoEl = DateTime.Now;
            
            regionImpactoRepository.SaveOrUpdate(regionImpacto);
        }
    }
}
