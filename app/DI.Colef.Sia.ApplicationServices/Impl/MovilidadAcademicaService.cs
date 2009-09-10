using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class MovilidadAcademicaService : IMovilidadAcademicaService
    {
        readonly IRepository<MovilidadAcademica> movilidadAcademicaRepository;

        public MovilidadAcademicaService(IRepository<MovilidadAcademica> movilidadAcademicaRepository)
        {
            this.movilidadAcademicaRepository = movilidadAcademicaRepository;
        }

        public MovilidadAcademica GetMovilidadAcademicaById(int id)
        {
            return movilidadAcademicaRepository.Get(id);
        }

        public MovilidadAcademica[] GetAllMovilidadAcademicas()
        {
            return ((List<MovilidadAcademica>)movilidadAcademicaRepository.GetAll()).ToArray();
        }
        
        public MovilidadAcademica[] GetActiveMovilidadAcademicas()
        {
            return ((List<MovilidadAcademica>)movilidadAcademicaRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveMovilidadAcademica(MovilidadAcademica movilidadAcademica)
        {
            if(movilidadAcademica.Id == 0)
            {
                movilidadAcademica.Activo = true;
                movilidadAcademica.CreadorEl = DateTime.Now;
            }
            movilidadAcademica.ModificadoEl = DateTime.Now;
            
            movilidadAcademicaRepository.SaveOrUpdate(movilidadAcademica);
        }

	    public MovilidadAcademica[] GetAllMovilidadAcademicas(Usuario usuario)
	    {
            return ((List<MovilidadAcademica>)movilidadAcademicaRepository.FindAll(new Dictionary<string, object> { { "Usuario", usuario } })).ToArray();
	    }
    }
}
