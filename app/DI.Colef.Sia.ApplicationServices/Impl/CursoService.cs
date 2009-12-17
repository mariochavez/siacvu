using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class CursoService : ICursoService
    {
        readonly IRepository<Curso> cursoRepository;
	    readonly IFirmaService firmaService;

        public CursoService(IRepository<Curso> cursoRepository, IFirmaService firmaService)
        {
            this.cursoRepository = cursoRepository;
            this.firmaService = firmaService;
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
            SaveCurso(curso, false);
        }

        public void SaveCurso(Curso curso, bool commit)
        {
            if(curso.IsTransient())
            {
                curso.Activo = true;
                curso.CreadoEl = DateTime.Now;

                var firma = new Firma
                                {
                                    Aceptacion1 = 0,
                                    Aceptacion2 = 0,
                                    Aceptacion3 = 0,
                                    Firma1 = DateTime.Now,
                                    Firma2 = DateTime.Now,
                                    Firma3 = DateTime.Now,
                                    TipoProducto = curso.TipoProducto,
                                    CreadoPor = curso.Usuario,
                                    ModificadoPor = curso.Usuario
                                };

                firmaService.SaveFirma(firma);

                curso.Firma = firma;
            }
            curso.ModificadoEl = DateTime.Now;
            
            cursoRepository.SaveOrUpdate(curso);
            
            if (commit)
                cursoRepository.DbContext.CommitChanges();
        }

	    public Curso[] GetAllCursos(Usuario usuario)
	    {
            return ((List<Curso>)cursoRepository.FindAll(new Dictionary<string, object> { { "Usuario", usuario } })).ToArray();
	    }
    }
}
