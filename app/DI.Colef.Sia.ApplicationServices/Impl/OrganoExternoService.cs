using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class OrganoExternoService : IOrganoExternoService
    {
        readonly IRepository<OrganoExterno> organoExternoRepository;

        public OrganoExternoService(IRepository<OrganoExterno> organoExternoRepository)
        {
            this.organoExternoRepository = organoExternoRepository;
        }

        public OrganoExterno GetOrganoExternoById(int id)
        {
            return organoExternoRepository.Get(id);
        }

        public OrganoExterno[] GetAllOrganoExternos()
        {
            return ((List<OrganoExterno>)organoExternoRepository.GetAll()).ToArray();
        }
        
        public OrganoExterno[] GetActiveOrganoExternos()
        {
            return ((List<OrganoExterno>)organoExternoRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveOrganoExterno(OrganoExterno organoExterno)
        {
            if(organoExterno.Id == 0)
            {
                organoExterno.Activo = true;
                organoExterno.CreadorEl = DateTime.Now;
            }
            organoExterno.ModificadoEl = DateTime.Now;
            
            organoExternoRepository.SaveOrUpdate(organoExterno);
        }
    }
}
