using AutoMapper;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web
{
    public class ColefProfile : Profile
    {
        public const string VIEW_MODEL = "Colef";

        protected override string ProfileName
        {
            get { return VIEW_MODEL; }
        }

        protected override void Configure()
        {
            base.Configure();
            AllowNullDestinationValues = false;

            CreateMaps();
        }

        private void CreateMaps()
        {
            Mapper.CreateMap<Rol, RolForm>();
            Mapper.CreateMap<Cargo, CargoForm>();
            Mapper.CreateMap<Puesto, PuestoForm>();
            Mapper.CreateMap<Departamento, DepartamentoForm>();
            Mapper.CreateMap<Sede, SedeForm>();
            Mapper.CreateMap<Categoria, CategoriaForm>();
            Mapper.CreateMap<GradoAcademico, GradoAcademicoForm>();
            Mapper.CreateMap<SNI, SNIForm>();
        }
    }
}