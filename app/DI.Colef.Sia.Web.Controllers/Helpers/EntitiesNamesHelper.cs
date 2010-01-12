using System;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;
using uNhAddIns.Inflector;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers
{
    public static class EntitiesNamesHelper
    {
        public static string GetObjectNameNewButton<T>(this GenericViewData<T> viewData)
        {
            return viewData.GetGenericType().Name.Replace("Form", "").EndsWith("o") ? "+ Nuevo" : "+ Nueva";
        }

        public static string GetObjectName<T>(this GenericViewData<T> viewData)
        {
            return GetObjectName(viewData.GetGenericType(), false, false, false);
        }

        public static string GetPluralObjectName<T>(this GenericViewData<T> viewData)
        {
            return GetObjectName(viewData.GetGenericType(), true, false, false);
        }

        public static string GetObjectIndexTitle<T>(this GenericViewData<T> viewData)
        {
            return GetObjectName(viewData.GetGenericType(), true, false, true);
        }

        public static string GetObjectNew<T>(this GenericViewData<T> viewData)
        {
            return GetObjectName(viewData.GetGenericType(), false, true, false);
        }

        static string GetObjectName(Type objectType, bool pluralize, bool newObject, bool title)
        {
            var spanishInflector = new SpanishInflector();

            var name = String.Empty;

            switch (objectType.Name)
            {
                case "ArticuloForm":
                    var word1 = "artículo";
                    var word2 = "revista";
                    var word3 = newObject ? "un nuevo" : String.Empty;

                    if (pluralize)
                    {
                        word1 = spanishInflector.Pluralize(word1);
                        word2 = spanishInflector.Pluralize(word2);
                    }

                    if (title)
                        word1 = spanishInflector.Titleize(word1);

                    name = String.Format("{0} {1} en {2} de investigación", word3, word1, word2);
                    break;
            }

            return name;
        }
    }
}
