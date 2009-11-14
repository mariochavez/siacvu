using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class TesisPosgradoService : ITesisPosgradoService
    {
        readonly IRepository<TesisPosgrado> tesisPosgradoRepository;

        public TesisPosgradoService(IRepository<TesisPosgrado> tesisPosgradoRepository)
        {
            this.tesisPosgradoRepository = tesisPosgradoRepository;
        }

        public TesisPosgrado GetTesisPosgradoById(int id)
        {
            return tesisPosgradoRepository.Get(id);
        }

        public TesisPosgrado[] GetAllTesisPosgrados()
        {
            return ((List<TesisPosgrado>) tesisPosgradoRepository.GetAll()).ToArray();
        }
    }
}