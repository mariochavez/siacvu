using AutoMapper;
using SharpArch.Core.DomainModel;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public abstract class AutoFormMapper<TModel, TForm> : Mapper<TModel, TForm> where TModel : Entity, new()
    {
        protected AutoFormMapper(IRepository<TModel> repository) : base(repository) { }

        public override K Map<T, K>(T model)
        {
            return Mapper.Map<T, K>(model);
        }
    }
}
