using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.Core;

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

        public static string Libros(this HtmlHelper html, Libro[] libros)
        {
            var info = string.Empty;

            if (libros.Length > 0)
            {
                info = "<span class='titulovalor'>Libros</span><br/>";

                foreach (var libro in libros)
                {
                    info += string.Format("{0} {1}. {2}.<br/>");
                    info += string.Format("<em>{0}</em>. {1}. {2}");
                }

                info += "<br/>";
            }

            return info;
        }

        public static string Capitulos(this HtmlHelper html, Capitulo[] capitulos)
        {
            var info = string.Empty;

            if (capitulos.Length > 0)
            {
                info = "<span class='titulovalor'>Capítulos en libros</span><br/>";

                foreach (var capitulo in capitulos)
                {
                    info += string.Format("{0}. {1}. {2}.<br/>");
                    info += string.Format("En {0}, <em>{1}</em>. {2}. {3}");
                }

                info += "<br/>";
            }

            return info;
        }

        public static string Resenas(this HtmlHelper html, Resena[] resenas)
        {
            var info = string.Empty;

            if (resenas.Length > 0)
            {
                info = "<span class='titulovalor'>Reseñas y Notas Críticas</span><br/>";

                foreach (var resena in resenas)
                {
                    info += string.Format("<em>{0}</em>. {1}. {2}.<br/>");
                    info += string.Format("{0}, {1}. {2} {3},<br/>");
                    info += string.Format("{0} - {1}");
                }

                info += "<br/>";
            }

            return info;
        }

        public static string Reportes(this HtmlHelper html, Reporte[] reportes)
        {
            var info = string.Empty;

            if (reportes.Length > 0)
            {
                info = "<span class='titulovalor'>Cuadernos de Trabajo/ Reportes Técnicos</span><br/>";

                foreach (var reporte in reportes)
                {
                    info += string.Format("<u>{0}</u>. {1}. {2}.<br/>");
                    info += string.Format("{0}, <em>{1}</em><br/>");
                }

                info += "<br/>";
            }

            return info;
        }

        public static string Cursos(this HtmlHelper html, Curso[] cursos)
        {
            var info = string.Empty;

            if(cursos.Length > 0)
            {
                foreach (var curso in cursos)
                {
                    info += string.Format("{0}. {1} {2}. {3}.<br/>", curso.Nombre, curso.ProgramaEstudio, curso.Institucion.Nombre, curso.FechaFinal);
                    info += string.Format("{0}. ({1} hora(s)). <br/>", curso.FechaFinal, curso.NumeroHoras);
                }

                info += "<br/>";
            }

            return info;
        }

        public static string TesisDirigidas(this HtmlHelper html, TesisDirigida[] tesisDirigidas)
        {
            var info = string.Empty;

            if (tesisDirigidas.Length > 0)
            {
                foreach (var tesisDirigida in tesisDirigidas)
                {
                    info += string.Format("{0}. {1}. <u>{2}</u>.<br/>");
                    info += string.Format("{0}. {1}. {2}.<br/>");
                }

                info += "<br/>";
            }

            return info;
        }

        public static string EstanciasInstitucionExterna(this HtmlHelper html, EstanciaInstitucionExterna[] estanciaInstitucionExternas)
        {
            var info = string.Empty;

            if (estanciaInstitucionExternas.Length > 0)
            {
                foreach (var estanciaInstitucionExterna in estanciaInstitucionExternas)
                {
                    info += string.Format("<em>Estancia {0}</em>. {1}. {2}.<br/>");
                    info += string.Format("{0}. {1} a {2}.<br/>");
                }

                info += "<br/>";
            }

            return info;
        }

        public static string OrganosExternos(this HtmlHelper html, OrganoExterno[] organoExternos)
        {
            var info = string.Empty;

            if(organoExternos.Length > 0)
            {
                foreach (var organoExterno in organoExternos)
                {
                    info += string.Format("{0}. {1} {2}.<br/>");
                    info += string.Format("{0}/{1}, {2}. {3} a {4}.<br/>");
                }

                info += "<br/>";
            }

            return info;
        }

        public static string Distinciones(this HtmlHelper html, Distincion[] distinciones)
        {
            var info = string.Empty;

            if (distinciones.Length > 0)
            {
                foreach (var distincion in distinciones)
                {
                    info += string.Format("{0} {1} {2}.<br/>", distincion.TipoDistincion.Nombre, distincion.Titulo, distincion.Descripcion);
                    info += string.Format("{0}. {1}.<br/>", distincion.Institucion.Nombre, distincion.FechaOtorgamiento.Year);
                }

                info += "<br/>";
            }

            return info;
        }

        public static string Proyectos(this HtmlHelper html, Proyecto[] proyectos)
        {
            var info = string.Empty;

            if (proyectos.Length > 0)
            {
                foreach (var proyecto in proyectos)
                {
                    info += string.Format("<em>{0}</em>. {1} / {2}.<br/>");
                    info += string.Format("{0}. {1} {2} a {3} {4}. <br/>");
                }

                info += "<br/>";
            }

            return info;
        }

        public static string Eventos(this HtmlHelper html, Evento[] eventos)
        {
            var info = string.Empty;

            if (eventos.Length > 0)
            {
                foreach (var evento in eventos)
                {
                    info += string.Format("<u>{0}</u>. <em>{1}:</em> {2}.<br/>");
                    info += string.Format("{0}, {1}. {2}. {3} {4}. <br/>");
                }

                info += "<br/>";
            }

            return info;
        }
    }
}
