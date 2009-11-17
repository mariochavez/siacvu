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
            string nombreTipoProducto;

            switch (tipoProducto)
            {
                case 1:
                    nombreTipoProducto = "Con arbitraje";
                    break;
                case 2:
                    nombreTipoProducto = "Sin arbitraje";
                    break;
                default:
                    return "";
            }

            return nombreTipoProducto;
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
    }
}