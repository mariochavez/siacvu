using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface IMapper<TModel, TForm> where TModel : Entity, new()
    {
        TForm Map(TModel model);
        TModel Map(TForm form);
        TForm[] Map(TModel[] model);
    }
}
