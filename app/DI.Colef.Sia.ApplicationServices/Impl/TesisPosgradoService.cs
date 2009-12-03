using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class TesisPosgradoService : ITesisPosgradoService
    {
        readonly IRepository<TesisPosgrado> tesisPosgradoRepository;
        readonly ITesisPosgradoQuerying tesisPosgradoQuerying;

        public TesisPosgradoService(IRepository<TesisPosgrado> tesisPosgradoRepository, ITesisPosgradoQuerying tesisPosgradoQuerying)
        {
            this.tesisPosgradoRepository = tesisPosgradoRepository;
            this.tesisPosgradoQuerying = tesisPosgradoQuerying;
        }

        public TesisPosgrado GetTesisPosgradoById(int id)
        {
            return tesisPosgradoRepository.Get(id);
        }

        public TesisPosgrado[] GetAllTesisPosgrados()
        {
            return ((List<TesisPosgrado>) tesisPosgradoRepository.GetAll()).ToArray();
        }

        public TesisPosgrado[] FindUnsedTesisInvestigador(Investigador investigador)
        {
            return tesisPosgradoQuerying.FindUnsedTesisInvestigador(investigador);
        }
    }
}