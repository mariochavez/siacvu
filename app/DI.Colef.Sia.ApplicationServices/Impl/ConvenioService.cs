using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class ConvenioService : IConvenioService
    {
        readonly IRepository<Convenio> convenioRepository;

        public ConvenioService(IRepository<Convenio> convenioRepository)
        {
            this.convenioRepository = convenioRepository;
        }

        public Convenio GetConvenioById(int id)
        {
            return convenioRepository.Get(id);
        }

        public Convenio[] GetAllConvenios()
        {
            return ((List<Convenio>) convenioRepository.GetAll()).ToArray();
        }
    }
}