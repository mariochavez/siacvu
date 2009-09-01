using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class ProyectoService : IProyectoService
    {
        readonly IRepository<Proyecto> proyectoRepository;

        public ProyectoService(IRepository<Proyecto> proyectoRepository)
        {
            this.proyectoRepository = proyectoRepository;
        }

        public Proyecto GetProyectoById(int id)
        {
            return proyectoRepository.Get(id);
        }

        public Proyecto[] GetAllProyectos()
        {
            return ((List<Proyecto>)proyectoRepository.GetAll()).ToArray();
        }
        
        public Proyecto[] GetActiveProyectos()
        {
            return ((List<Proyecto>)proyectoRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveProyecto(Proyecto proyecto)
        {
            if(proyecto.Id == 0)
            {
                proyecto.Activo = true;
                proyecto.CreadorEl = DateTime.Now;
            }
            proyecto.ModificadoEl = DateTime.Now;
            
            proyectoRepository.SaveOrUpdate(proyecto);
        }
    }
}
