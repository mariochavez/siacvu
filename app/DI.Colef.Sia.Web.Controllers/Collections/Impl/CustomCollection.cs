using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections.Impl
{
    public class CustomCollection : ICustomCollection
    {
        public CustomSelectForm[] VolumenCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "I"},
                           new CustomSelectForm {Id = 2, Nombre = "II"},
                           new CustomSelectForm {Id = 3, Nombre = "III"},
                           new CustomSelectForm {Id = 4, Nombre = "IV"}
                       };
        }
    }
}