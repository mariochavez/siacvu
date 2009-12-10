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
	    readonly IFirmaService firmaService;

        public ObraTraducidaService(IRepository<ObraTraducida> obraTraducidaRepository,
            IProductoQuerying productoQuerying, IFirmaService firmaService)
        {
            this.obraTraducidaRepository = obraTraducidaRepository;
            this.productoQuerying = productoQuerying;
            this.firmaService = firmaService;
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
            if(obraTraducida.IsTransient())
            {
                obraTraducida.Puntuacion = 0;
                obraTraducida.Activo = true;
                obraTraducida.CreadoEl = DateTime.Now;

                var firma = new Firma
                                {
                                    Aceptacion1 = 0,
                                    Aceptacion2 = 0,
                                    Aceptacion3 = 0,
                                    Firma1 = DateTime.Now,
                                    Firma2 = DateTime.Now,
                                    Firma3 = DateTime.Now,
                                    TipoProducto = obraTraducida.TipoProducto,
                                    CreadoPor = obraTraducida.Usuario,
                                    ModificadoPor = obraTraducida.Usuario
                                };

                firmaService.SaveFirma(firma);

                obraTraducida.Firma = firma;
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