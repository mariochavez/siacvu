using System.Collections;
using System.Collections.Generic;
using System.Web.Mvc;

namespace DecisionesInteligentes.Colef.Sia.Web.Extensions
{
    public static class DropDownListExtensions
    {
        public static SelectList CreateSelectList<T>(this IEnumerable elements, string value, string data)
        {
            var list = new List<T>();

            if (elements != null)
            {
                foreach (var element in elements)
                {
                    list.Add((T) element);
                }
            }

            return new SelectList(list, value, data);
        }
    }
}