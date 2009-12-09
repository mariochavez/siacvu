using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using SharpArch.Core.PersistenceSupport;

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

        public void SaveEvento(Evento evento)
        {
            if(evento.Id == 0)
            {
                evento.Puntuacion = 0;
                evento.Activo = true;
                evento.CreadoEl = DateTime.Now;

                var firma = new Firma
                {
                    Aceptacion1 = 0,
                    Aceptacion2 = 0,
                    Aceptacion3 = 0,
                    Firma1 = DateTime.Now,
                    Firma2 = DateTime.Now,
                    Firma3 = DateTime.Now,
                    TipoProducto = evento.TipoProducto,
                    CreadoPor = evento.Usuario,
                    ModificadoPor = evento.Usuario
                };

                firmaservice.SaveFirma(firma);

                evento.Firma = firma;
            }

            evento.PosicionAutor = 1;
            evento.ModificadoEl = DateTime.Now;
            
            eventoRepository.SaveOrUpdate(evento);
        }

	    public Evento[] GetAllEventos(Usuario usuario)
	    {
            return productoQuerying.GetProductosByUsuario<Evento>(usuario, "CoautorInternoEventos");
	    }
    }
}
