using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class InvestigadorMapper : AutoFormMapper<Investigador, InvestigadorForm>, IInvestigadorMapper
    {
        readonly IUsuarioService usuarioService;
        readonly ICargoInvestigadorMapper cargoInvestigadorMapper;
        readonly ICategoriaInvestigadorMapper categoriaInvestigadorMapper;
        readonly IGradoAcademicoInvestigadorMapper gradoAcademicoInvestigadorMapper;
        readonly IEstadoInvestigadorMapper estadoInvestigadorMapper;
        readonly ISNIInvestigadorMapper sniInvestigadorMapper;
        readonly ICatalogoService catalogoService;

        public InvestigadorMapper(IRepository<Investigador> repository, 
            IUsuarioService usuarioService, ICargoInvestigadorMapper cargoInvestigadorMapper,
            ICategoriaInvestigadorMapper categoriaInvestigadorMapper,
            IGradoAcademicoInvestigadorMapper gradoAcademicoInvestigadorMapper,
            IEstadoInvestigadorMapper estadoInvestigadorMapper,
            ISNIInvestigadorMapper sniInvestigadorMapper,
            ICatalogoService catalogoService)
            : base(repository)
        {
            this.usuarioService = usuarioService;
            this.cargoInvestigadorMapper = cargoInvestigadorMapper;
            this.categoriaInvestigadorMapper = categoriaInvestigadorMapper;
            this.gradoAcademicoInvestigadorMapper = gradoAcademicoInvestigadorMapper;
            this.estadoInvestigadorMapper = estadoInvestigadorMapper;
            this.sniInvestigadorMapper = sniInvestigadorMapper;
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(InvestigadorForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(InvestigadorForm message, Investigador model)
        {
            if (model.IsTransient())
            {
                model.Usuario = usuarioService.GetUsuarioById(message.Usuario);
            }
            model.FechaIngreso = message.FechaIngreso.FromShortDateToDateTime();
            model.FechaContrato = message.FechaContrato.FromShortDateToDateTime();

            if(message.CargoInvestigador != null)
                model.AddCargo(cargoInvestigadorMapper.Map(message.CargoInvestigador));

            if (message.CategoriaInvestigador != null)
                model.AddCategoria(categoriaInvestigadorMapper.Map(message.CategoriaInvestigador));

            if (message.GradoAcademicoInvestigador != null)
                model.AddGrado(gradoAcademicoInvestigadorMapper.Map(message.GradoAcademicoInvestigador));

            if (message.EstadoInvestigador != null)
                model.AddEstado(estadoInvestigadorMapper.Map(message.EstadoInvestigador));

            if (message.SNIInvestigador != null)
                model.AddSNI(sniInvestigadorMapper.Map(message.SNIInvestigador));
        }

        public Investigador Map(InvestigadorForm message, Usuario usuario)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.CreadoPor = usuario;
                model.CargosInvestigador[0].CreadoPor = usuario;
                model.CategoriasInvestigador[0].CreadoPor = usuario;
                model.EstadosInvestigador[0].CreadoPor = usuario;
                model.GradosAcademicosInvestigador[0].CreadoPor = usuario;
                model.SNIsInvestigador[0].CreadoPor = usuario;

                model.CargosInvestigador[0].ModificadoPor = usuario;
                model.CategoriasInvestigador[0].ModificadoPor = usuario;
                model.EstadosInvestigador[0].ModificadoPor = usuario;
                model.GradosAcademicosInvestigador[0].ModificadoPor = usuario;
                model.SNIsInvestigador[0].ModificadoPor = usuario;
            }

            model.ModificadoPor = usuario;

            model.AreaTematica = catalogoService.GetAreaTematicaById(message.AreaTematicaId);
            model.AreaTematica1 = message.AreaTematica1;
            model.AreaTematica2 = message.AreaTematica2;
            model.AreaTematica3 = message.AreaTematica3;

            model.ExpedienteAcademico = message.ExpedienteAcademico;
            model.ExpedienteProduccion = message.ExpedienteProduccion;
            model.ClaveCVU = message.ClaveCVU;
            model.ExpedienteSNI = message.ExpedienteSNI;

            return model;
        }

        public override InvestigadorForm Map(Investigador model)
        {
            var message = base.Map(model);

            if (model.AreaTematica != null)
                message.LineaTematicaId = model.AreaTematica.LineaTematica.Id;

            return message;
        }
    }
}
