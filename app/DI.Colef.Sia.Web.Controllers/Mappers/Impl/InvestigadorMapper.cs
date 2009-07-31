using System;
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

        public InvestigadorMapper(IRepository<Investigador> repository, 
            IUsuarioService usuarioService, ICargoInvestigadorMapper cargoInvestigadorMapper,
            ICategoriaInvestigadorMapper categoriaInvestigadorMapper,
            IGradoAcademicoInvestigadorMapper gradoAcademicoInvestigadorMapper,
            IEstadoInvestigadorMapper estadoInvestigadorMapper,
            ISNIInvestigadorMapper sniInvestigadorMapper)
            : base(repository)
        {
            this.usuarioService = usuarioService;
            this.cargoInvestigadorMapper = cargoInvestigadorMapper;
            this.categoriaInvestigadorMapper = categoriaInvestigadorMapper;
            this.gradoAcademicoInvestigadorMapper = gradoAcademicoInvestigadorMapper;
            this.estadoInvestigadorMapper = estadoInvestigadorMapper;
            this.sniInvestigadorMapper = sniInvestigadorMapper;
        }

        protected override int GetIdFromMessage(InvestigadorForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(InvestigadorForm message, Investigador model)
        {
            model.Usuario = usuarioService.GetUsuarioById(message.Usuario);
            model.FechaIngreso = message.FechaIngreso.FromShortDateToDateTime();

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
    }
}
