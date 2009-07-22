namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData
{
    public class GenericViewData<T> : BaseViewData
    {
        public T[] List { get; set; }
        public T Form { get; set; }
    }
}
