using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers
{
    public static class ParticipacionMedioHelper
    {
        public static string OtraParticipacion(this HtmlHelper html, ParticipacionMedioForm producto)
        {
            var info = string.Empty;
            var etiqueta = " ; <span class='valor'>{0}&nbsp;</span>";

            if (producto.TipoParticipacionNombre.Equals("Otro"))
                info = string.Format(etiqueta, producto.OtroTipoParticipacion);

            return info;
        }
    }
}
