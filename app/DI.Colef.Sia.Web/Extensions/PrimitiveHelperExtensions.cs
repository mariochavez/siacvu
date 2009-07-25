using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Extensions
{
    public static class PrimitiveHelperExtensions
    {
        public static string ToNullSafeString(this object value)
        {
            return value == null ? String.Empty : value.ToString();
        }
    }
}
