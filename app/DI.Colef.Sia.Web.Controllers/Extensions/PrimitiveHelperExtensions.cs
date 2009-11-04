using System;
using System.Collections;

namespace DecisionesInteligentes.Colef.Sia.Web.Extensions
{
    public static class PrimitiveHelperExtensions
    {
        public static string ToNullSafeString(this object value)
        {
            return value == null ? String.Empty : value.ToString();
        }

        public static string ToCustomShortDateString(this DateTime value)
        {
            return value <= DateTime.Parse("1910-01-01") ? String.Empty : (value).ToString("dd/MM/yyyy");
        }

        public static DateTime FromShortDateToDateTime(this string value)
        {
            //Fecha Vacia se guarda como 01/01/1980
            if (value.IsNullOrEmpty())
                return DateTime.ParseExact("01/01/1910", "dd/MM/yyyy", null);

            var normalizedValue = value;

            var dateSegments = value.Split('/');
            if (dateSegments.Length == 3)
            {
                if (dateSegments[0].Length == 1)
                    dateSegments[0] = "0" + dateSegments[0];

                if (dateSegments[1].Length == 1)
                    dateSegments[1] = "0" + dateSegments[1];

                normalizedValue = String.Format("{0}/{1}/{2}", dateSegments[0], dateSegments[1], dateSegments[2]);
            }

            try
            {
                //Fecha Intoducida con formato correcto
                return DateTime.ParseExact(normalizedValue, "dd/MM/yyyy", null);
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
                return DateTime.ParseExact("01/01/1910", "dd/MM/yyyy", null);

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