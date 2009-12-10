using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using NHibernate;
using SharpArch.Core.PersistenceSupport;
using SharpArch.Data.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class ProyectoService : IProyectoService
    {
        readonly IRepository<Proyecto> proyectoRepository;
	    readonly IFirmaService firmaService;

        public ProyectoService(IRepository<Proyecto> proyectoRepository, IFirmaService firmaService)
        {
            this.proyectoRepository = proyectoRepository;
            this.firmaService = firmaService;
        }

        protected virtual ISession Session
        {
            get
            {
                string factoryKey = SessionFactoryAttribute.GetKeyFrom(this);
                return NHibernateSession.CurrentFor(factoryKey);
            }
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

        public void SaveProyecto(Proyecto proyecto, bool useCommit)
        {
            if (proyecto.IsTransient())
            {
                proyecto.Activo = true;
                proyecto.CreadoEl = DateTime.Now;

                var firma = new Firma
                                {
                                    Aceptacion1 = 0,
                                    Aceptacion2 = 0,
                                    Aceptacion3 = 0,
                                    Firma1 = DateTime.Now,
                                    Firma2 = DateTime.Now,
                                    Firma3 = DateTime.Now,
                                    TipoProducto = proyecto.TipoProducto,
                                    CreadoPor = proyecto.Usuario,
                                    ModificadoPor = proyecto.Usuario
                                };

                firmaService.SaveFirma(firma);

                proyecto.Firma = firma;
            }

            proyecto.ModificadoEl = DateTime.Now;

            if (useCommit)
            {
                using (ITransaction t = Session.BeginTransaction())
                {
                    Session.SaveOrUpdate(proyecto);
                    t.Commit();
                }
            }
            else
                proyectoRepository.SaveOrUpdate(proyecto);
        }
    }
}
