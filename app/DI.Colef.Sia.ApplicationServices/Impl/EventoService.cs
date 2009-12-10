using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using NHibernate;
using SharpArch.Core.PersistenceSupport;
using SharpArch.Data.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public class EventoService : IEventoService
    {
        readonly IRepository<Evento> eventoRepository;
        readonly IProductoQuerying productoQuerying;
        readonly IFirmaService firmaservice;

        public EventoService(IRepository<Evento> eventoRepository, IProductoQuerying productoQuerying,
            IFirmaService firmaservice)
        {
            this.eventoRepository = eventoRepository;
            this.productoQuerying = productoQuerying;
            this.firmaservice = firmaservice;
        }

        protected virtual ISession Session
        {
            get
            {
                string factoryKey = SessionFactoryAttribute.GetKeyFrom(this);
                return NHibernateSession.CurrentFor(factoryKey);
            }
        }

        public Evento GetEventoById(int id)
        {
            return eventoRepository.Get(id);
        }

        public Evento[] GetAllEventos()
        {
            return ((List<Evento>)eventoRepository.GetAll()).ToArray();
        }
        
        public Evento[] GetActiveEventos()
        {
            return ((List<Evento>)eventoRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveEvento(Evento evento, bool useCommit)
        {
            if(evento.Id == 0)
            {
                evento.Puntuacion = 0;
                evento.Activo = true;
                evento.CreadoEl = DateTime.Now;

                //var firma = new Firma
                //{
                //    Aceptacion1 = 0,
                //    Aceptacion2 = 0,
                //    Aceptacion3 = 0,
                //    Firma1 = DateTime.Now,
                //    Firma2 = DateTime.Now,
                //    Firma3 = DateTime.Now,
                //    TipoProducto = evento.TipoProducto,
                //    CreadoPor = evento.Usuario,
                //    ModificadoPor = evento.Usuario
                //};

                //firmaservice.SaveFirma(firma);

                //evento.Firma = firma;
            }

            evento.PosicionAutor = 1;
            evento.ModificadoEl = DateTime.Now;

            if (useCommit)
            {
                using (ITransaction t = Session.BeginTransaction())
                {
                    Session.SaveOrUpdate(evento);
                    t.Commit();
                }
            }

            else
                eventoRepository.SaveOrUpdate(evento);
        }

	    public Evento[] GetAllEventos(Usuario usuario)
	    {
            return productoQuerying.GetProductosByUsuario<Evento>(usuario, "CoautorInternoEventos");
	    }
    }
}