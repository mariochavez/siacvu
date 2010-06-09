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
            var lowerUpperS = producto == 0 ? " S" : " s";
            var lowerUpperC = producto == 0 ? " C" : " c";

            switch (tipoProducto)
            {
                case 1:
                    nombreTipoProducto = GetNombreProducto(producto) + lowerUpperC + "on arbitraje anónimo";
                    break;
                case 2:
                    nombreTipoProducto = GetNombreProducto(producto) + lowerUpperS + "in arbitraje anónimo";
                    break;
                default:
                    return "";
            }

            return nombreTipoProducto;
        }

        public static string GetNombreProducto(int tipoProducto)
        {
            var nombreProducto = "";

            switch (tipoProducto)
            {
                case 0:
                    nombreProducto = "";
                    break;
                case 1:
                    nombreProducto = "Artículo";
                    break;
                case 2:
                    nombreProducto = "Capítulo";
                    break;
                case 3:
                    nombreProducto = "Curso";
                    break;
                case 4:
                    nombreProducto = "Dictamen";
                    break;
                case 6:
                    nombreProducto = "Evento";
                    break;
                case 7:
                    nombreProducto = "Libro";
                    break;
                case 8:
                    nombreProducto = "Órgano externo";
                    break;
                case 10:
                    nombreProducto = "Participación en medio";
                    break;
                case 11:
                    nombreProducto = "Reporte";
                    break;
                case 12:
                    nombreProducto = "Reseña";
                    break;
                case 13:
                    nombreProducto = "Tesis dirigida";
                    break;
                case 15:
                    nombreProducto = "Proyecto";
                    break;
                case 16:
                    nombreProducto = "Artículo de difusión";
                    break;
                case 20:
                    nombreProducto = "Obra traducida";
                    break;
            }

            return nombreProducto;
        }

        public static string TipoObraTraducida(int tipoObraTraducida)
        {
            string nombreTipoObraTraducida = "";

            switch (tipoObraTraducida)
            {
                case 1:
                    nombreTipoObraTraducida = "Artículo en revista";
                    break;
                case 2:
                    nombreTipoObraTraducida = "Libro";
                    break;
                case 3:
                    nombreTipoObraTraducida = "Capítulo en libro";
                    break;
            }

            return nombreTipoObraTraducida;
        }

        public static string EstadoProducto(int estadoProducto)
        {
            string nombreEstadoProducto;

            switch (estadoProducto)
            {
                case 1:
                    nombreEstadoProducto = "En dictamen";
                    break;
                case 2:
                    nombreEstadoProducto = "Aceptado";
                    break;
                case 3:
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

        public static string TipoEditorial(int tipoEditorial)
        {
            string nombreTipoEditorial;

            switch (tipoEditorial)
            {
                case 1:
                    nombreTipoEditorial = "RCCI";
                    break;
                default:
                    return "";
            }

            return nombreTipoEditorial;
        }

        public static string FormaParticipacion(int formaParticipacion)
        {
            string nombreFormaParticipacion;

            switch (formaParticipacion)
            {
                case 1:
                    nombreFormaParticipacion = "Director";
                    break;
                case 2:
                    nombreFormaParticipacion = "Co-director";
                    break;
                case 3:
                    nombreFormaParticipacion = "Lector";
                    break;
                case 4:
                    nombreFormaParticipacion = "Sinodal";
                    break;
                default:
                    return "";
            }

            return nombreFormaParticipacion;
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

        public static string TipoTesis(int tipoTesis)
        {
            string nombreTipoTesis;

            switch (tipoTesis)
            {
                case 1:
                    nombreTipoTesis = "Tesis de El Colef";
                    break;
                case 2:
                    nombreTipoTesis = "Tesis externas";
                    break;
                default:
                    return "";
            }

            return nombreTipoTesis;
        }

        public static string TipoCurso(int tipoCurso)
        {
            string nombreTipoCurso;

            switch (tipoCurso)
            {
                case 1:
                    nombreTipoCurso = "Cursos en El Colef";
                    break;
                case 2:
                    nombreTipoCurso = "Cursos externos";
                    break;
                default:
                    return "";
            }

            return nombreTipoCurso;
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

        public static string FormatoPublicacion(int formatoPublicacion)
        {
            string nombreFormatoPublicacion;

            switch (formatoPublicacion)
            {
                case 1:
                    nombreFormatoPublicacion = "De autor(es)";
                    break;
                case 2:
                    nombreFormatoPublicacion = "Coordinación";
                    break;
                case 3:
                    nombreFormatoPublicacion = "Compilación";
                    break;
                default:
                    return "";
            }

            return nombreFormatoPublicacion;
        }

        public static string ContenidoLibro(int contenidoLibro)
        {
            string nombreContenidoLibro;

            switch (contenidoLibro)
            {
                case 1:
                    nombreContenidoLibro = "Obra científica";
                    break;
                case 2:
                    nombreContenidoLibro = "Memoria de evento";
                    break;
                case 3:
                    nombreContenidoLibro = "Número especial de revista";
                    break;
                case 4:
                    nombreContenidoLibro = "Serie breviarium";
                    break;
                case 5:
                    nombreContenidoLibro = "Reportes estadísticos";
                    break;
                default:
                    return "";
            }

            return nombreContenidoLibro;
        }

        public static string TipoReporte(int tipoReporte)
        {
            string nombreTipoReporte;

            switch (tipoReporte)
            {
                case 1:
                    nombreTipoReporte = "Documento de trabajo";
                    break;
                case 2:
                    nombreTipoReporte = "Reporte técnico";
                    break;
                default:
                    return "";
            }

            return nombreTipoReporte;
        }

        public static string TipoResena(int tipoResena)
        {
            string nombreTipoResena;

            switch (tipoResena)
            {
                case 1:
                    nombreTipoResena = "Nota crítica";
                    break;
                case 2:
                    nombreTipoResena = "Reseña bibliográfica";
                    break;
                default:
                    return "";
            }

            return nombreTipoResena;
        }

        public static string FormatDate(DateTime creadoEl)
        {
            return creadoEl <= DateTime.Parse("1910-01-01") ? String.Empty : (creadoEl).ToString("dd MMM, yyyy");
        }

        public static string EstadoProyecto(int estadoProyecto)
        {
            var estado = "";

            switch (estadoProyecto)
            {
                case 1:
                    estado = "Vigente";
                    break;
                case 2:
                    estado = "Terminado";
                    break;
                case 3:
                    estado = "Cancelado";
                    break;
            }

            return estado;
        }

        public static string ImpactoPoliticaPublica(int impactoPoliticaPublica)
        {
            string nombreImpactoPoliticaPublica;

            switch (impactoPoliticaPublica)
            {
                case 1:
                    nombreImpactoPoliticaPublica = "Elaboración de diagnóstico";
                    break;
                case 2:
                    nombreImpactoPoliticaPublica = "Elaboración de plan estratégico";
                    break;
                case 3:
                    nombreImpactoPoliticaPublica = "Diseño de programa";
                    break;
                case 4:
                    nombreImpactoPoliticaPublica = "Diseño de estrategias";
                    break;
                case 5:
                    nombreImpactoPoliticaPublica = "Evaluación de política";
                    break;
                case 6:
                    nombreImpactoPoliticaPublica = "Evaluación de impacto";
                    break;
                case 7:
                    nombreImpactoPoliticaPublica = "Otro";
                    break;
                default:
                    return "";
            }

            return nombreImpactoPoliticaPublica;
        }

        public static string TipoEstudiante(int estudiante)
        {
            var tipoEstudiante = "";

            switch (estudiante)
            {
                case 1:
                    tipoEstudiante = "Estudiantes de El Colef";
                    break;
                case 2:
                    tipoEstudiante = "Estudiantes externos";
                    break;
            }

            return tipoEstudiante;
        }

        public static string ProductoGenerado(int producto)
        {
            var productoGenerado = "";

            switch (producto)
            {
                case 1:
                    productoGenerado = "Base de datos";
                    break;
                case 2:
                    productoGenerado = "Informe técnico";
                    break;
                case 3:
                    productoGenerado = "Reporte final";
                    break;
            }

            return productoGenerado;
        }

        public static string EntidadExperienciaProfesional(int entidadId)
        {
            var entidad = string.Empty;

            switch (entidadId)
            {
                case 1:
                    entidad = "Empresa";
                    break;
                case 2:
                    entidad = "Institución";
                    break;
                case 3:
                    entidad = "Actividad profesional";
                    break;
            }

            return entidad;
        }
    }
}