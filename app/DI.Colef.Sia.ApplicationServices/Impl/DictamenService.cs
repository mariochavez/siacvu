using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class DictamenService : IDictamenService
    {
        readonly IRepository<Dictamen> dictamenRepository;
	    readonly IFirmaService firmaService;

        public DictamenService(IRepository<Dictamen> dictamenRepository, IFirmaService firmaService)
        {
            this.dictamenRepository = dictamenRepository;
            this.firmaService = firmaService;
        }

        public Dictamen GetDictamenById(int id)
        {
            return dictamenRepository.Get(id);
        }

        public Dictamen[] GetAllDictamenes()
        {
            return ((List<Dictamen>)dictamenRepository.GetAll()).ToArray();
        }
        
        public Dictamen[] GetActiveDictamenes()
        {
            return ((List<Dictamen>)dictamenRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveDictamen(Dictamen dictamen)
        {
            if(dictamen.IsTransient())
            {
                dictamen.Puntuacion = 0;
                dictamen.Activo = true;
                dictamen.CreadoEl = DateTime.Now;

                var firma = new Firma
                                {
                                    Aceptacion1 = 0,
                                    Aceptacion2 = 0,
                                    Aceptacion3 = 0,
                                    Firma1 = DateTime.Now,
                                    Firma2 = DateTime.Now,
                                    Firma3 = DateTime.Now,
                                    TipoProducto = dictamen.TipoProducto,
                                    CreadoPor = dictamen.Usuario,
                                    ModificadoPor = dictamen.Usuario
                                };

                firmaService.SaveFirma(firma);

                dictamen.Firma = firma;
            }
            dictamen.ModificadoEl = DateTime.Now;
            
            dictamenRepository.SaveOrUpdate(dictamen);
        }

	    public Dictamen[] GetAllDictamenes(Usuario usuario)
	    {
            return ((List<Dictamen>)dictamenRepository.FindAll(new Dictionary<string, object> { { "Usuario", usuario } })).ToArray();
	    }
    }
}
