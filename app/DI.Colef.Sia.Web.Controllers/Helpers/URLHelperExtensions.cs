namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers
{
    public static class URLHelperExtensions
    {
        public static string UrlToName(this string value)
        {

            return value.StartsWith("/") ? value.Remove(0, 1).Replace('/', '_') : value.Replace('/', '_');
        }
    }
}
