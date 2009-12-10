using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class OrganoExternoService : IOrganoExternoService
    {
        readonly IRepository<OrganoExterno> organoExternoRepository;
	    readonly IFirmaService firmaService;

        public OrganoExternoService(IRepository<OrganoExterno> organoExternoRepository, IFirmaService firmaService)
        {
            this.organoExternoRepository = organoExternoRepository;
            this.firmaService = firmaService;
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
            if (organoExterno.IsTransient())
            {
                organoExterno.Activo = true;
                organoExterno.CreadoEl = DateTime.Now;

                var firma = new Firma
                                {
                                    Aceptacion1 = 0,
                                    Aceptacion2 = 0,
                                    Aceptacion3 = 0,
                                    Firma1 = DateTime.Now,
                                    Firma2 = DateTime.Now,
                                    Firma3 = DateTime.Now,
                                    TipoProducto = organoExterno.TipoProducto,
                                    CreadoPor = organoExterno.Usuario,
                                    ModificadoPor = organoExterno.Usuario
                                };

                firmaService.SaveFirma(firma);

                organoExterno.Firma = firma;
            }
            organoExterno.ModificadoEl = DateTime.Now;
            
            organoExternoRepository.SaveOrUpdate(organoExterno);
        }

	    public OrganoExterno[] GetAllOrganoExternos(Usuario usuario)
	    {
            return ((List<OrganoExterno>)organoExternoRepository.FindAll(new Dictionary<string, object> { { "Usuario", usuario } })).ToArray();
	    }
    }
}
