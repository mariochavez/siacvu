using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class TesisDirigidaService : ITesisDirigidaService
    {
        readonly IRepository<TesisDirigida> tesisDirigidaRepository;
        readonly IProductoQuerying productoQuerying;
        readonly IFirmaService firmaservice;

        public TesisDirigidaService(IRepository<TesisDirigida> tesisDirigidaRepository,
            IProductoQuerying productoQuerying, IFirmaService firmaservice)
        {
            this.tesisDirigidaRepository = tesisDirigidaRepository;
            this.productoQuerying = productoQuerying;
            this.firmaservice = firmaservice;
        }

        public TesisDirigida GetTesisDirigidaById(int id)
        {
            return tesisDirigidaRepository.Get(id);
        }

        public TesisDirigida[] GetAllTesisDirigidas()
        {
            return ((List<TesisDirigida>)tesisDirigidaRepository.GetAll()).ToArray();
        }
        
        public TesisDirigida[] GetActiveTesisDirigidas()
        {
            return ((List<TesisDirigida>)tesisDirigidaRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveTesisDirigida(TesisDirigida tesisDirigida)
        {
            if(tesisDirigida.Id == 0)
            {
                tesisDirigida.Puntuacion = 0;
                tesisDirigida.Activo = true;
                tesisDirigida.CreadoEl = DateTime.Now;

                //var firma = new Firma
                //{
                //    Aceptacion1 = 0,
                //    Aceptacion2 = 0,
                //    Aceptacion3 = 0,
                //    Firma1 = DateTime.Now,
                //    Firma2 = DateTime.Now,
                //    Firma3 = DateTime.Now,
                //    TipoProducto = tesisDirigida.TipoProducto,
                //    CreadoPor = tesisDirigida.Usuario,
                //    ModificadoPor = tesisDirigida.Usuario
                //};

                //firmaservice.SaveFirma(firma);

                //tesisDirigida.Firma = firma;
            }
            tesisDirigida.ModificadoEl = DateTime.Now;
            
            tesisDirigidaRepository.SaveOrUpdate(tesisDirigida);
        }

	    public TesisDirigida[] GetAllTesisDirigidas(Usuario usuario)
	    {
            return ((List<TesisDirigida>)tesisDirigidaRepository.FindAll(new Dictionary<string, object> { { "Usuario", usuario } })).ToArray();
	    }
    }
}
