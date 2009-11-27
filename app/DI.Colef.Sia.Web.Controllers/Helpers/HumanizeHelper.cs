using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers
{
    public class HumanizeHelper
    {
        public static string Sexo(string sexo)
        {
            return sexo == "H" ? "Masculino" : (sexo == "M" ? "Femenino" : "");
        }

        public static string Boolean(bool value)
        {
            return value ? "Si" : "No";
        }

        public static string TipoProducto(int tipoProducto)
        {
            return TipoProducto(tipoProducto, 0);
        }

        public static string TipoProducto(int tipoProducto, int producto)
        {
            string nombreTipoProducto;
            var lowerUpperS = producto == 0 ? "S" : "s";
            var lowerUpperC = producto == 0 ? "C" : "c";

            switch (tipoProducto)
            {
                case 1:
                    nombreTipoProducto = GetNombreProducto(producto) + lowerUpperC + "on arbitraje";
                    break;
                case 2:
                    nombreTipoProducto = GetNombreProducto(producto) + lowerUpperS + "in arbitraje";
                    break;
                default:
                    return "";
            }

            return nombreTipoProducto;
        }

        private static string GetNombreProducto(int tipoProducto)
        {
            var nombreProducto = "";

            switch (tipoProducto)
            {
                case 0:
                    nombreProducto = "";
                    break;
                case 1:
                    nombreProducto = "Artículo ";
                    break;
                case 2:
                    nombreProducto = "Capítulo ";
                    break;
            }

            return nombreProducto;
        }

        public static string EstadoProducto(int estadoProducto)
        {
            string nombreEstadoProducto;

            switch (estadoProducto)
            {
                case 1:
                    nombreEstadoProducto = "Aceptado";
                    break;
                case 2:
                    nombreEstadoProducto = "Publicado";
                    break;
                default:
                    return "";
            }

            return nombreEstadoProducto;
        }

        public static string Edicion(int edicion)
        {
            string nombreEdicion;

            switch (edicion)
            {
                case 1:
                    nombreEdicion = "Primera edición";
                    break;
                case 2:
                    nombreEdicion = "Segunda edición";
                    break;
                case 3:
                    nombreEdicion = "Tercera edición";
                    break;
                default:
                    return "";
            }

            return nombreEdicion;
        }

        public static string Reimpresion(int reimpresion)
        {
            string nombreReimpresion;

            switch (reimpresion)
            {
                case 1:
                    nombreReimpresion = "Primera";
                    break;
                case 2:
                    nombreReimpresion = "Segunda";
                    break;
                case 3:
                    nombreReimpresion = "Tercera";
                    break;
                default:
                    return "";
            }

            return nombreReimpresion;
        }

        public static string Volumen(int volumen)
        {
            string nombreVolumen;

            switch (volumen)
            {
                case 1:
                    nombreVolumen = "I";
                    break;
                case 2:
                    nombreVolumen = "II";
                    break;
                case 3:
                    nombreVolumen = "III";
                    break;
                case 4:
                    nombreVolumen = "IV";
                    break;
                default:
                    return "";
            }

            return nombreVolumen;
        }

        public static string NivelIdioma(int nivelIdioma)
        {
            string nombreNivelIdioma;

            switch (nivelIdioma)
            {
                case 1:
                    nombreNivelIdioma = "Bajo";
                    break;
                case 2:
                    nombreNivelIdioma = "Medio";
                    break;
                case 3:
                    nombreNivelIdioma = "Alto";
                    break;
                default:
                    return "";
            }

            return nombreNivelIdioma;
        }

        public static string TipoAlumnoCurso(int tipoAlumnoCurso)
        {
            string nombreTipoAlumnoCurso;

            switch (tipoAlumnoCurso)
            {
                case 1:
                    nombreTipoAlumnoCurso = "Interno";
                    break;
                case 2:
                    nombreTipoAlumnoCurso = "Externo";
                    break;
                default:
                    return "";
            }

            return nombreTipoAlumnoCurso;
        }

        public static string Periodo(int periodo)
        {
            string nombrePeriodo;

            switch (periodo)
            {
                case 1:
                    nombrePeriodo = "Primer periodo";
                    break;
                case 2:
                    nombrePeriodo = "Segundo periodo";
                    break;
                default:
                    return "";
            }

            return nombrePeriodo;
        }

        public static string TipoInstitucion(bool value)
        {
            return value ? "Nacional" : "Extranjera";
        }

        public static string TipoRevista(int tipoRevista)
        {
            string nombreTipoRevista;

            switch (tipoRevista)
            {
                case 1:
                    nombreTipoRevista = "Con arbitraje anónimo";
                    break;
                case 2:
                    nombreTipoRevista = "Sin arbitraje anónimo";
                    break;
                case 3:
                    nombreTipoRevista = "Sin arbitraje";
                    break;
                default:
                    return "";
            }

            return nombreTipoRevista;
        }

        public static string Periodicidad(int periodicidad)
        {
            string nombrePeriodicidad;

            switch (periodicidad)
            {
                case 1:
                    nombrePeriodicidad = "Mensual";
                    break;
                case 2:
                    nombrePeriodicidad = "Bimestral";
                    break;
                case 3:
                    nombrePeriodicidad = "Trimestral";
                    break;
                case 4:
                    nombrePeriodicidad = "Cuatrimestral";
                    break;
                case 5:
                    nombrePeriodicidad = "Semestral";
                    break;
                case 6:
                    nombrePeriodicidad = "Anual";
                    break;
                default:
                    return "";
            }

            return nombrePeriodicidad;
        }

        public static string ClasificacionSieva(int clasificacionSieva)
        {
            string nombreClasificacionSieva;

            switch (clasificacionSieva)
            {
                case 1:
                    nombreClasificacionSieva = "Tipo A";
                    break;
                case 2:
                    nombreClasificacionSieva = "Tipo B";
                    break;
                case 3:
                    nombreClasificacionSieva = "Tipo C";
                    break;
                case 4:
                    nombreClasificacionSieva = "Tipo D";
                    break;
                default:
                    return "";
            }

            return nombreClasificacionSieva;
        }

        public static string FormatoRevista(int formatoRevista)
        {
            string nombreFormatoRevista;

            switch (formatoRevista)
            {
                case 1:
                    nombreFormatoRevista = "Revista impresa";
                    break;
                case 2:
                    nombreFormatoRevista = "Revista electrónica";
                    break;
                case 3:
                    nombreFormatoRevista = "Ambas";
                    break;
                default:
                    return "";
            }

            return nombreFormatoRevista;
        }

        public static string TipoLibro(int tipoLibro)
        {
            string nombreTipoLibro;

            switch (tipoLibro)
            {
                case 1:
                    nombreTipoLibro = "Coordinación";
                    break;
                case 2:
                    nombreTipoLibro = "Compilación";
                    break;
                default:
                    return "";
            }

            return nombreTipoLibro;
        }
    }
}