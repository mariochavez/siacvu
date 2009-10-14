using System;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class AlumnoService : IAlumnoService
    {
        readonly IRepository<Alumno> alumnoRepository;

        public AlumnoService(IRepository<Alumno> alumnoRepository)
        {
            this.alumnoRepository = alumnoRepository;
        }

        public Alumno GetAlumnoById(int id)
        {
            return alumnoRepository.Get(id);
        }
    }
}