using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class ExperienciaProfesionalService : IExperienciaProfesionalService
    {
        readonly IRepository<ExperienciaProfesional> experienciaProfesionalRepository;

        public ExperienciaProfesionalService(IRepository<ExperienciaProfesional> experienciaProfesionalRepository)
        {
            this.experienciaProfesionalRepository = experienciaProfesionalRepository;
        }

        public ExperienciaProfesional GetExperienciaProfesionalById(int id)
        {
            return experienciaProfesionalRepository.Get(id);
        }

        public ExperienciaProfesional[] GetAllExperienciasProfesionales()
        {
            return ((List<ExperienciaProfesional>)experienciaProfesionalRepository.GetAll()).ToArray();
        }
        
        public ExperienciaProfesional[] GetActiveExperienciasProfesionales()
        {
            return ((List<ExperienciaProfesional>)experienciaProfesionalRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveExperienciaProfesional(ExperienciaProfesional experienciaProfesional)
        {
            if(experienciaProfesional.Id == 0)
            {
                experienciaProfesional.Activo = true;
                experienciaProfesional.CreadorEl = DateTime.Now;
            }
            experienciaProfesional.ModificadoEl = DateTime.Now;
            
            experienciaProfesionalRepository.SaveOrUpdate(experienciaProfesional);
        }

	    public ExperienciaProfesional[] GetAllExperienciasProfesionales(Usuario usuario)
	    {
            return ((List<ExperienciaProfesional>)experienciaProfesionalRepository.FindAll(new Dictionary<string, object> { { "Usuario", usuario } })).ToArray();
	    }
    }
}
