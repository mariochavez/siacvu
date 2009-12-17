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
	    readonly IFirmaService firmaService;

        public ResenaService(IRepository<Resena> resenaRepository, IProductoQuerying productoQuerying, IFirmaService firmaService)
        {
            this.resenaRepository = resenaRepository;
            this.productoQuerying = productoQuerying;
            this.firmaService = firmaService;
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
            SaveResena(resena, false);
        }

        public void SaveResena(Resena resena, bool commit)
        {
            if(resena.IsTransient())
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

                firmaService.SaveFirma(firma);

                resena.Firma = firma;
            }

            resena.ModificadoEl = DateTime.Now;
            
            resenaRepository.SaveOrUpdate(resena);
            
            if (commit)
                resenaRepository.DbContext.CommitChanges();
        }

	    public Resena[] GetAllResenas(Usuario usuario)
	    {
            return productoQuerying.GetProductosByUsuario<Resena>(usuario, "CoautorInternoResenas");
	    }
    }
}
