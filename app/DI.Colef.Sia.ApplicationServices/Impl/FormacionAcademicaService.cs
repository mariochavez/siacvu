using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class FormacionAcademicaService : IFormacionAcademicaService
    {
        readonly IRepository<FormacionAcademica> formacionAcademicaRepository;

        public FormacionAcademicaService(IRepository<FormacionAcademica> formacionAcademicaRepository)
        {
            this.formacionAcademicaRepository = formacionAcademicaRepository;
        }

        public FormacionAcademica GetFormacionAcademicaById(int id)
        {
            return formacionAcademicaRepository.Get(id);
        }

        public FormacionAcademica[] GetAllFormacionAcademicas()
        {
            return ((List<FormacionAcademica>)formacionAcademicaRepository.GetAll()).ToArray();
        }
        
        public FormacionAcademica[] GetActiveFormacionAcademicas()
        {
            return ((List<FormacionAcademica>)formacionAcademicaRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveFormacionAcademica(FormacionAcademica formacionAcademica)
        {
            if(formacionAcademica.Id == 0)
            {
                formacionAcademica.Activo = true;
                formacionAcademica.CreadorEl = DateTime.Now;
            }
            formacionAcademica.ModificadoEl = DateTime.Now;
            
            formacionAcademicaRepository.SaveOrUpdate(formacionAcademica);
        }
    }
}
