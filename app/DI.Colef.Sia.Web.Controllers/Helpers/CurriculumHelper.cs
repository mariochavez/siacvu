using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers
{
    public static class CurriculumHelper
    {
        public static string InvestigadorSede(this HtmlHelper html, string sedeNombre)
        {
            var info = string.Empty;

            if(sedeNombre.Contains("Tijuana"))
                info = "<span class='valor'>Km 18.5 Carretera Escénica Tijuana - Ensenada, San Antonio del Mar,</span><br/>"+
			            "<span class='valor'>Tijuana, Baja California, México. C.P. 22560</span><br/>"+
			            "<span class='valor'>P.O. Box 'L', Chula Vista, CA. 91912-1257, USA</span><br/>";
            if (sedeNombre.Contains("Ciudad Juárez"))
                info = "<span class='valor'>Av. Insurgentes No. 3708, Col. Los Nogales. Ciudad Juárez, Chihuahua,</span><br/>"+
			            "<span class='valor'>México. C.P. 32350</span><br/>"+
			            "<span class='valor'>PMB 6248, Edgemere 761 El Paso Texas 79925. USA</span><br/>";
            if (sedeNombre.Contains("Mexicali"))
                info = "<span class='valor'>Av. Zaragoza No. 1850, Col. Nueva, Mexicali, Baja California, México. C.P. 21100</span><br/>" +
                       "<span class='valor'>P.O. Box 'L', Chula Vista, CA. 91912-1257, USA</span><br/>";
            if (sedeNombre.Contains("Nogales"))
                info = "<span class='valor'>Carretera Internacional Km. 5.5. Altos Local 2, Nogales, Sonora. México. C.P. 84000</span><br/>";
            if (sedeNombre.Contains("Monterrey"))
                info = "<span class='valor'>Calle Técnicos 277 Esq. Río Pánuco, Col. Tecnológico, Monterrey, Nuevo León.</span><br/>" +
                       "<span class='valor'>México. C.P. 64700</span><br/>";
            if (sedeNombre.Contains("Matamoros"))
                info = "<span class='valor'>Calle Herrera No. 169 entre 16 y 17, Zona Centro, Matamoros, Tamaulipas, México.</span><br/>" +
                        "<span class='valor'>C.P. 87300</span><br/>" +
                        "<span class='valor'>P.O. Box 2319, Brownsville TX. 78522, USA.</span><br/>";
            if (sedeNombre.Contains("Nuevo Laredo"))
                info = "<span class='valor'>Calle Arteaga No. 1702, Esq. Av. 20 de Noviembre Col. Victoria,  Nuevo Laredo,</span><br/>" +
                        "<span class='valor'>Tamaulipas. México. C.P. 88030</span><br/>" +
                        "<span class='valor'>P.O. Box 6415, Laredo Texas, 78042, USA</span><br/>";
            if (sedeNombre.Contains("Piedras Negras"))
                info = "<span class='valor'>Calle Hacienda No. 503, Esq. Av. Rodolfo de los Santos, Col Burócratas, Piedras </span><br/>" +
                        "<span class='valor'>Negras, Coahulia, México.  C.P. 26020</span><br/>";

            if (sedeNombre.Contains(""))
                info = "<span class='valor'></span><br/>" +
                        "<span class='valor'></span><br/>" +
                        "<span class='valor'></span><br/>";
            return info;
        }

        public static CurriculumDTO[] ListaProductoTipo(this HtmlHelper html, CurriculumDTO[] listaProductos, int tipoProducto)
        {
            return (from productos in listaProductos where productos.TipoProducto.Equals(tipoProducto) select productos).ToArray();
        }
    }
}
