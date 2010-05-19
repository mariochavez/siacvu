using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers
{
    public static class EventoHelper
    {
        public static string OtroEvento(this HtmlHelper html, EventoForm producto)
        {
            var info = string.Empty;
            var etiqueta = " ; <span class='valor'>{0}&nbsp;</span>";

            if (producto.TipoEventoNombre.Equals("Otro"))
                info = string.Format(etiqueta, producto.OtroTipoEvento);

            return info;
        }
    }
}