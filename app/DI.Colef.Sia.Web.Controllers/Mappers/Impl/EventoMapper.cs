using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class EventoMapper : AutoFormMapper<Evento, EventoForm>, IEventoMapper
    {
        readonly ICatalogoService catalogoService;
        readonly ICoautorExternoEventoMapper coautorExternoEventoMapper;
        readonly ICoautorInternoEventoMapper coautorInternoEventoMapper;

        public EventoMapper(IRepository<Evento> repository, ICatalogoService catalogoService,
            ICoautorExternoEventoMapper coautorExternoEventoMapper,
            ICoautorInternoEventoMapper coautorInternoEventoMapper
        )
            : base(repository)
        {
            this.catalogoService = catalogoService;
            this.coautorExternoEventoMapper = coautorExternoEventoMapper;
            this.coautorInternoEventoMapper = coautorInternoEventoMapper;
        }

        protected override int GetIdFromMessage(EventoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(EventoForm message, Evento model)
        {
            model.Nombre = message.Nombre;
            model.Titulo = message.Titulo;
            model.Invitacion = message.Invitacion;
            model.Ciudad = message.Ciudad;
            model.PalabraClave1 = message.PalabraClave1;
            model.PalabraClave2 = message.PalabraClave2;
            model.PalabraClave3 = message.PalabraClave3;

            model.FechaInicial = message.FechaInicial.FromShortDateToDateTime();
            model.FechaFinal = message.FechaFinal.FromShortDateToDateTime();

            model.Ambito = catalogoService.GetAmbitoById(message.Ambito);
            model.DirigidoA = catalogoService.GetDirigidoAById(message.DirigidoA);
            model.TipoParticipacion = catalogoService.GetTipoParticipacionById(message.TipoParticipacion);
            model.TipoEvento = catalogoService.GetTipoEventoById(message.TipoEvento);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematicaId);
            model.TipoFinanciamiento = catalogoService.GetTipoFinanciamientoById(message.TipoFinanciamiento);
            model.Pais = catalogoService.GetPaisById(message.Pais);
            model.EstadoPais = catalogoService.GetEstadoPaisById(message.EstadoPais);
        }

        public Evento Map(EventoForm message, Usuario usuario, Investigador investigador)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadorPor = usuario;
                model.Sede = investigador.CargosInvestigador[investigador.CargosInvestigador.Count - 1].Sede;
                model.Departamento = investigador.CargosInvestigador[investigador.CargosInvestigador.Count - 1].Departamento;
            }

            model.ModificadoPor = usuario;

            return model;
        }

        public Evento Map(EventoForm message, Usuario usuario, Investigador investigador,
            CoautorExternoProductoForm[] coautoresExternos, CoautorInternoProductoForm[] coautoresInternos)
        {
            var model = Map(message, usuario, investigador);

            if (coautoresExternos != null)
            {
                foreach (var coautorExterno in coautoresExternos)
                {
                    var coautor =
                        coautorExternoEventoMapper.Map(coautorExterno);

                    coautor.CreadorPor = usuario;
                    coautor.ModificadoPor = usuario;

                    model.AddCoautorExterno(coautor);
                }
            }

            if (coautoresInternos != null)
            {
                foreach (var coautorInterno in coautoresInternos)
                {
                    var coautor =
                        coautorInternoEventoMapper.Map(coautorInterno);

                    coautor.CreadorPor = usuario;
                    coautor.ModificadoPor = usuario;

                    model.AddCoautorInterno(coautor);
                }
            }

            return model;
        }
    }
}
