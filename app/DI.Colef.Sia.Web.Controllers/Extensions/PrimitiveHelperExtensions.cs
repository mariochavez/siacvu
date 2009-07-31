using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Extensions
{
    public static class PrimitiveHelperExtensions
    {
        public static string ToNullSafeString(this object value)
        {
            return value == null ? String.Empty : value.ToString();
        }

        public static DateTime FromShortDateToDateTime(this string value)
        {
            if (value.IsNullOrEmpty())
                return DateTime.MinValue;

            return DateTime.ParseExact(value, "dd/MM/yyyy", null);
        }

        public static bool IsNullOrEmpty(this string value)
        {
            return String.IsNullOrEmpty(value);
        }
    }
}
