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
            //Fecha Vacia se guarda como 01/01/1980
            if (value.IsNullOrEmpty())
                return DateTime.ParseExact("01/01/1980", "dd/MM/yyyy", null);

            try
            {
                //Fecha Intoducida con formato correcto
                return DateTime.ParseExact(value, "dd/MM/yyyy", null);
            }
            catch (Exception)
            {
                //Fecha Intoducida con formato incorrecto
                return DateTime.ParseExact("01/01/1900", "dd/MM/yyyy", null);
            }
        }

        public static DateTime FromYearDateToDateTime(this string value)
        {
            //Fecha Vacia se guarda como 01/01/1980
            if (value.IsNullOrEmpty())
                return DateTime.ParseExact("01/01/1980", "dd/MM/yyyy", null);

            try
            {
                //Fecha Intoducida con formato correcto
                return DateTime.ParseExact("01/01/" + value, "dd/MM/yyyy", null);
            }
            catch (Exception)
            {
                //Fecha Intoducida con formato incorrecto
                return DateTime.ParseExact("01/01/1900", "dd/MM/yyyy", null);
            }
        }

        public static bool IsNullOrEmpty(this string value)
        {
            return String.IsNullOrEmpty(value);
        }
    }
}