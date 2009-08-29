using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class GrupoInvestigacionService : IGrupoInvestigacionService
    {
        readonly IRepository<GrupoInvestigacion> grupoInvestigacionRepository;

        public GrupoInvestigacionService(IRepository<GrupoInvestigacion> grupoInvestigacionRepository)
        {
            this.grupoInvestigacionRepository = grupoInvestigacionRepository;
        }

        public GrupoInvestigacion GetGrupoInvestigacionById(int id)
        {
            return grupoInvestigacionRepository.Get(id);
        }

        public GrupoInvestigacion[] GetAllGrupoInvestigacions()
        {
            return ((List<GrupoInvestigacion>)grupoInvestigacionRepository.GetAll()).ToArray();
        }
        
        public GrupoInvestigacion[] GetActiveGrupoInvestigacions()
        {
            return ((List<GrupoInvestigacion>)grupoInvestigacionRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveGrupoInvestigacion(GrupoInvestigacion grupoInvestigacion)
        {
            if(grupoInvestigacion.Id == 0)
            {
                grupoInvestigacion.Activo = true;
                grupoInvestigacion.CreadorEl = DateTime.Now;
            }

            grupoInvestigacion.ModificadoEl = DateTime.Now;
            
            grupoInvestigacionRepository.SaveOrUpdate(grupoInvestigacion);
        }
    }
}
