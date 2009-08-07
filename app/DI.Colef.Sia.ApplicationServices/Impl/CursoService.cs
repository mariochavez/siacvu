using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class CursoService : ICursoService
    {
        readonly IRepository<Curso> cursoRepository;

        public CursoService(IRepository<Curso> cursoRepository)
        {
            this.cursoRepository = cursoRepository;
        }

        public Curso GetCursoById(int id)
        {
            return cursoRepository.Get(id);
        }

        public Curso[] GetAllCursos()
        {
            return ((List<Curso>)cursoRepository.GetAll()).ToArray();
        }
        
        public Curso[] GetActiveCursos()
        {
            return ((List<Curso>)cursoRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveCurso(Curso curso)
        {
            if(curso.Id == 0)
            {
                curso.Activo = true;
                curso.CreadorEl = DateTime.Now;
            }
            curso.ModificadoEl = DateTime.Now;
            
            cursoRepository.SaveOrUpdate(curso);
        }
    }
}
