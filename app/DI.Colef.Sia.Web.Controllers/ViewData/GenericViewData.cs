using System;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData
{
    public class GenericViewData<T> : BaseViewData
    {
        public T[] List { get; set; }
        public ProductoDTO[] ProductList { get; set; }
        public T Form { get; set; }
        public Type GetGenericType()
        {
            return typeof(T);
        }
    }
}
