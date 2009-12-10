using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class CapituloService : ICapituloService
    {
        readonly IRepository<Capitulo> capituloRepository;
        readonly IProductoQuerying productoQuerying;
	    readonly IFirmaService firmaService;

        public CapituloService(IRepository<Capitulo> capituloRepository,
                               IProductoQuerying productoQuerying, IFirmaService firmaService)
        {
            this.capituloRepository = capituloRepository;
            this.productoQuerying = productoQuerying;
            this.firmaService = firmaService;
        }

        public Capitulo GetCapituloById(int id)
        {
            return capituloRepository.Get(id);
        }

        public Capitulo[] GetAllCapitulos()
        {
            return ((List<Capitulo>)capituloRepository.GetAll()).ToArray();
        }
        
        public Capitulo[] GetActiveCapitulos()
        {
            return ((List<Capitulo>)capituloRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveCapitulo(Capitulo capitulo)
        {
            if (capitulo.IsTransient())
            {
                capitulo.Puntuacion = 0;
                capitulo.Activo = true;
                capitulo.CreadoEl = DateTime.Now;

                var firma = new Firma
                                {
                                    Aceptacion1 = 0,
                                    Aceptacion2 = 0,
                                    Aceptacion3 = 0,
                                    Firma1 = DateTime.Now,
                                    Firma2 = DateTime.Now,
                                    Firma3 = DateTime.Now,
                                    TipoProducto = capitulo.TipoProducto,
                                    CreadoPor = capitulo.Usuario,
                                    ModificadoPor = capitulo.Usuario
                                };

                firmaService.SaveFirma(firma);

                capitulo.Firma = firma;
            }

            capitulo.PosicionAutor = 1;
            capitulo.ModificadoEl = DateTime.Now;
            
            capituloRepository.SaveOrUpdate(capitulo);
        }

	    public Capitulo[] GetAllCapitulos(Usuario usuario)
	    {
            return productoQuerying.GetProductosByUsuario<Capitulo>(usuario, "CoautorInternoCapitulos");
	    }
    }
}