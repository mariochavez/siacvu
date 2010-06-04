using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections.Impl
{
    public class CustomCollection : ICustomCollection
    {
        public CustomSelectForm[] TipoProductoCustomCollection()
        {
            return TipoProductoCustomCollection(0);
        }

        public CustomSelectForm[] TipoProductoCustomCollection(int tipoProducto)
        {
            var lowerUpperS = tipoProducto == 0 ? "S" : "s";
            var lowerUpperC = tipoProducto == 0 ? "C" : "c";

            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = GetNombreProducto(tipoProducto) + lowerUpperC + "on arbitraje anónimo"},
                           new CustomSelectForm {Id = 2, Nombre = GetNombreProducto(tipoProducto) + lowerUpperS + "in arbitraje anónimo"}
                       };
        }

        public CustomSelectForm[] TipoLibroCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Coordinación"},
                           new CustomSelectForm {Id = 2, Nombre = "Compilación"}
                       };
        }

        public CustomSelectForm[] FormatoPublicacionCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "De autor(es)"},
                           new CustomSelectForm {Id = 2, Nombre = "Coordinación"},
                           new CustomSelectForm {Id = 3, Nombre = "Compilación"}
                       };
        }

        public CustomSelectForm[] ContenidoLibroCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Obra científica"},
                           new CustomSelectForm {Id = 2, Nombre = "Memoria de evento"},
                           new CustomSelectForm {Id = 3, Nombre = "Número especial de revista"},
                           new CustomSelectForm {Id = 4, Nombre = "Serie breviarium"},
                           new CustomSelectForm {Id = 5, Nombre = "Reportes estadísticos"}
                       };
        }

        public CustomSelectForm[] TipoReporteCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Documento de trabajo"},
                           new CustomSelectForm {Id = 2, Nombre = "Reporte técnico"}
                       };
        }

        public CustomSelectForm[] TipoResenaCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Nota crítica"},
                           new CustomSelectForm {Id = 2, Nombre = "Reseña bibliográfica"}
                       };
        }

        public CustomSelectForm[] FormaParticipacionCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Director"},
                           new CustomSelectForm {Id = 2, Nombre = "Co-director"},
                           new CustomSelectForm {Id = 3, Nombre = "Lector"},
                           new CustomSelectForm {Id = 4, Nombre = "Sinodal"}
                       };
        }

        public CustomSelectForm[] EstadoProyectoCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Vigente"},
                           new CustomSelectForm {Id = 2, Nombre = "Terminado"},
                           new CustomSelectForm {Id = 3, Nombre = "Cancelado"}
                       };
        }

        public CustomSelectForm[] TipoObraTraducidaCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Artículo en revista"},
                           new CustomSelectForm {Id = 2, Nombre = "Libro"},
                           new CustomSelectForm {Id = 3, Nombre = "Capítulo en libro"}
                       };
        }

        public CustomSelectForm[] ImpactoPoliticaPublicaCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Elaboración de diagnóstico"},
                           new CustomSelectForm {Id = 2, Nombre = "Elaboración de plan estratégico"},
                           new CustomSelectForm {Id = 3, Nombre = "Diseño de programa"},
                           new CustomSelectForm {Id = 4, Nombre = "Diseño de estrategias"},
                           new CustomSelectForm {Id = 5, Nombre = "Evaluación de política"},
                           new CustomSelectForm {Id = 6, Nombre = "Evaluación de impacto"},
                           new CustomSelectForm {Id = 7, Nombre = "Otro"}
                       };
        }

        public CustomSelectForm[] TipoEstudianteCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Estudiantes de El Colef"},
                           new CustomSelectForm {Id = 2, Nombre = "Estudiantes externos"}
                       };
        }

        public CustomSelectForm[] ProductoGeneradoCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Base de datos"},
                           new CustomSelectForm {Id = 2, Nombre = "Informe técnico"},
                           new CustomSelectForm {Id = 3, Nombre = "Reporte final"}
                       };
        }

        public CustomSelectForm[] TipoEditorialCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "RCCI"}
                       };
        }

        private string GetNombreProducto(int tipoProducto)
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
                case 7:
                    nombreProducto = "Libro ";
                    break;
            }

            return nombreProducto;
        }

        public CustomSelectForm[] EstadoProductoCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "En dictamen"},
                           new CustomSelectForm {Id = 2, Nombre = "Aceptado"},
                           new CustomSelectForm {Id = 3, Nombre = "Publicado"}
                       };
        }

        public CustomSelectForm[] EdicionCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Primera edición"},
                           new CustomSelectForm {Id = 2, Nombre = "Segunda edición"},
                           new CustomSelectForm {Id = 3, Nombre = "Tercera edición"}
                       };
        }

        public CustomSelectForm[] ReimpresionCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Primera"},
                           new CustomSelectForm {Id = 2, Nombre = "Segunda"},
                           new CustomSelectForm {Id = 3, Nombre = "Tercera"}
                       };
        }

        public CustomSelectForm[] NivelIdiomaCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Bajo"},
                           new CustomSelectForm {Id = 2, Nombre = "Medio"},
                           new CustomSelectForm {Id = 3, Nombre = "Alto"}
                       };
        }

        public CustomSelectForm[] TipoTesisCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Tesis de El Colef"},
                           new CustomSelectForm {Id = 2, Nombre = "Tesis externas"}
                       };
        }

        public CustomSelectForm[] TipoCursoCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Cursos en El Colef"},
                           new CustomSelectForm {Id = 2, Nombre = "Cursos externos"}
                       };
        }

        public CustomSelectForm[] PeriodoCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Primer periodo"},
                           new CustomSelectForm {Id = 2, Nombre = "Segundo periodo"}
                       };
        }

        public CustomSelectForm[] TipoRevistaCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Con arbitraje anónimo"},
                           new CustomSelectForm {Id = 2, Nombre = "Sin arbitraje anónimo"},
                           new CustomSelectForm {Id = 3, Nombre = "Sin arbitraje"}
                       };
        }

        public CustomSelectForm[] PeriodicidadCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Mensual"},
                           new CustomSelectForm {Id = 2, Nombre = "Bimestral"},
                           new CustomSelectForm {Id = 3, Nombre = "Trimestral"},
                           new CustomSelectForm {Id = 4, Nombre = "Cuatrimestral"},
                           new CustomSelectForm {Id = 5, Nombre = "Semestral"},
                           new CustomSelectForm {Id = 6, Nombre = "Anual"}
                       };
        }

        public CustomSelectForm[] ClasificacionSievaCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Tipo A"},
                           new CustomSelectForm {Id = 2, Nombre = "Tipo B"},
                           new CustomSelectForm {Id = 3, Nombre = "Tipo C"},
                           new CustomSelectForm {Id = 4, Nombre = "Tipo D"}
                       };
        }

        public CustomSelectForm[] FormatoRevistaCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Revista impresa"},
                           new CustomSelectForm {Id = 2, Nombre = "Revista electrónica"},
                           new CustomSelectForm {Id = 3, Nombre = "Ambas"}
                       };
        }

        public CustomSelectForm[] SectorCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Sector económico"},
                           new CustomSelectForm {Id = 2, Nombre = "Sector financiamiento"},
                           new CustomSelectForm {Id = 3, Nombre = "Sector órgano externo"}
                       };
        }

        public CustomSelectForm[] TipoParticipacionCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "en capítulos"},
                           new CustomSelectForm {Id = 2, Nombre = "en eventos"},
                           new CustomSelectForm {Id = 3, Nombre = "en participación en medios"}
                       };
        }

        public CustomSelectForm[] EstatusFormacionAcademicaCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm()
                       };
        }

        public CustomSelectForm[] EntidadExperienciaProfesionalCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Actividad profesional"},
                           new CustomSelectForm {Id = 2, Nombre = "Empresa"},
                           new CustomSelectForm {Id = 3, Nombre = "Institución"}
                       };
        }
    }
}