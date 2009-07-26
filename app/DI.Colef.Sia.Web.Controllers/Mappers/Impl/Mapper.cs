using System;
using SharpArch.Core.DomainModel;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public abstract class Mapper<TModel, TMessage> : IMapper<TModel, TMessage> where TModel : Entity, new()
    {
        private readonly IRepository<TModel> repository;

        protected Mapper(IRepository<TModel> repository)
        {
            this.repository = repository;
        }

        public abstract K Map<T, K>(T model);

        public virtual TMessage Map(TModel model)
        {
            return Map<TMessage>(model);
        }

        public TMessage2 Map<TMessage2>(TModel model)
        {
            return Map<TModel, TMessage2>(model);
        }

        public virtual TModel Map(TMessage message)
        {
            TModel model = repository.Get(GetIdFromMessage(message)) ?? new TModel();
            MapToModel(message, model);
            return model;
        }

        public TMessage[] Map(TModel[] model)
        {
            return Map<TModel[], TMessage[]>(model);
        }

        protected abstract int GetIdFromMessage(TMessage message);
        protected abstract void MapToModel(TMessage message, TModel model);

        protected static DateTime? ToDateTime(string value)
        {
            DateTime result;
            bool success = DateTime.TryParse(value, out result);
            if (!success)
            {
                return null;
            }
            return result;
        }

        protected static int ToInt32(string value)
        {
            if (string.IsNullOrEmpty(value))
            {
                return default(int);
            }
            return Convert.ToInt32(value);
        }
    }
}
