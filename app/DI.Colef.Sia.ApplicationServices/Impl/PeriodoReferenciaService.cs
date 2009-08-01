using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class PeriodoReferenciaService : IPeriodoReferenciaService
    {
        readonly IRepository<PeriodoReferencia> periodoReferenciaRepository;

        public PeriodoReferenciaService(IRepository<PeriodoReferencia> periodoReferenciaRepository)
        {
            this.periodoReferenciaRepository = periodoReferenciaRepository;
        }

        public PeriodoReferencia GetPeriodoReferenciaById(int id)
        {
            return periodoReferenciaRepository.Get(id);
        }

        public PeriodoReferencia[] GetAllPeriodoReferencias()
        {
            return ((List<PeriodoReferencia>) periodoReferenciaRepository.GetAll()).ToArray();
        }

        public void SavePeriodoReferencia(PeriodoReferencia periodoReferencia)
        {
            if(periodoReferencia.Id == 0)
            {
                periodoReferencia.Activo = true;
                periodoReferencia.CreadorEl = DateTime.Now;
            }
            periodoReferencia.ModificadoEl = DateTime.Now;
            
            periodoReferenciaRepository.SaveOrUpdate(periodoReferencia);
        }
    }
}
