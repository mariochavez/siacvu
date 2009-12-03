using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class OrganoInternoService : IOrganoInternoService
    {
        readonly IRepository<OrganoInterno> organoInternoRepository;

        public OrganoInternoService(IRepository<OrganoInterno> organoInternoRepository)
        {
            this.organoInternoRepository = organoInternoRepository;
        }

        public OrganoInterno GetOrganoInternoById(int id)
        {
            return organoInternoRepository.Get(id);
        }

        public OrganoInterno[] GetAllOrganoInternos()
        {
            return ((List<OrganoInterno>)organoInternoRepository.GetAll()).ToArray();
        }
        
        public OrganoInterno[] GetActiveOrganoInternos()
        {
            return ((List<OrganoInterno>)organoInternoRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveOrganoInterno(OrganoInterno organoInterno)
        {
            if(organoInterno.Id == 0)
            {
                organoInterno.Activo = true;
                organoInterno.CreadoEl = DateTime.Now;
            }
            organoInterno.ModificadoEl = DateTime.Now;
            
            organoInternoRepository.SaveOrUpdate(organoInterno);
        }

        public OrganoInterno[] GetAllOrganoInternos(Usuario usuario)
        {
            return ((List<OrganoInterno>)organoInternoRepository.FindAll(new Dictionary<string, object> { { "Usuario", usuario } })).ToArray();
        }
    }
}