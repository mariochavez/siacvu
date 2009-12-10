using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers
{
    public class IdValueHelper
    {
        public static int AddProductoValue(int guidNumber, int id)
        {
            var value = guidNumber != 0 ? guidNumber : id;

            return value;
        }
    }
}