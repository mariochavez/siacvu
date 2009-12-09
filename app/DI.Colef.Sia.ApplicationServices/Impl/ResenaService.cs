using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class ResenaService : IResenaService
    {
        readonly IRepository<Resena> resenaRepository;
        readonly IProductoQuerying productoQuerying;
        readonly IFirmaService firmaservice;

        public ResenaService(IRepository<Resena> resenaRepository, IProductoQuerying productoQuerying,
            IFirmaService firmaservice)
        {
            this.resenaRepository = resenaRepository;
            this.firmaservice = firmaservice;
            this.productoQuerying = productoQuerying;
        }

        public Resena GetResenaById(int id)
        {
            return resenaRepository.Get(id);
        }

        public Resena[] GetAllResenas()
        {
            return ((List<Resena>)resenaRepository.GetAll()).ToArray();
        }
        
        public Resena[] GetActiveResenas()
        {
            return ((List<Resena>)resenaRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveResena(Resena resena)
        {
            if(resena.Id == 0)
            {
                resena.Puntuacion = 0;
                resena.Activo = true;
                resena.CreadoEl = DateTime.Now;
                var firma = new Firma
                {
                    Aceptacion1 = 0,
                    Aceptacion2 = 0,
                    Aceptacion3 = 0,
                    Firma1 = DateTime.Now,
                    Firma2 = DateTime.Now,
                    Firma3 = DateTime.Now,
                    TipoProducto = resena.TipoProducto,
                    CreadoPor = resena.Usuario,
                    ModificadoPor = resena.Usuario
                };

                firmaservice.SaveFirma(firma);

                resena.Firma = firma;
            }

            resena.PosicionAutor = 1;
            resena.ModificadoEl = DateTime.Now;
            
            resenaRepository.SaveOrUpdate(resena);
        }

	    public Resena[] GetAllResenas(Usuario usuario)
	    {
            return productoQuerying.GetProductosByUsuario<Resena>(usuario, "CoautorInternoResenas");
	    }
    }
}
