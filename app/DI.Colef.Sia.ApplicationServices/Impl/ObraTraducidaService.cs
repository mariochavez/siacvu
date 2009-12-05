using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class ObraTraducidaService : IObraTraducidaService
    {
        readonly IRepository<ObraTraducida> obraTraducidaRepository;
        readonly IProductoQuerying productoQuerying;

        public ObraTraducidaService(IRepository<ObraTraducida> obraTraducidaRepository,
            IProductoQuerying productoQuerying)
        {
            this.obraTraducidaRepository = obraTraducidaRepository;
            this.productoQuerying = productoQuerying;
        }

        public ObraTraducida GetObraTraducidaById(int id)
        {
            return obraTraducidaRepository.Get(id);
        }

        public ObraTraducida[] GetAllObraTraducidas()
        {
            return ((List<ObraTraducida>)obraTraducidaRepository.GetAll()).ToArray();
        }
        
        public ObraTraducida[] GetActiveObraTraducidas()
        {
            return ((List<ObraTraducida>)obraTraducidaRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveObraTraducida(ObraTraducida obraTraducida)
        {
            if(obraTraducida.Id == 0)
            {
                obraTraducida.Puntuacion = 0;
                obraTraducida.Activo = true;
                obraTraducida.CreadoEl = DateTime.Now;
            }

            obraTraducida.PosicionAutor = 1;
            obraTraducida.ModificadoEl = DateTime.Now;
            
            obraTraducidaRepository.SaveOrUpdate(obraTraducida);
        }

        public ObraTraducida[] GetAllObraTraducidas(Usuario usuario)
        {
            return productoQuerying.GetProductosByUsuario<ObraTraducida>(usuario, "CoautorInternoObraTraducidas");
        }
    }
}