using System;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class FirmaService : IFirmaService
    {
        readonly IRepository<Firma> firmaRepository;

        public FirmaService(IRepository<Firma> firmaRepository)
        {
            this.firmaRepository = firmaRepository;   
        }

        public Firma GetFirmaById(int id)
        {
            return firmaRepository.Get(id);
        }

        public void SaveFirma(Firma firma)
        {
            if (firma.IsTransient())
            {
                firma.Activo = true;
                firma.CreadoEl = DateTime.Now;

            }

            firma.ModificadoEl = DateTime.Now;

            firmaRepository.SaveOrUpdate(firma);
        }
    }
}