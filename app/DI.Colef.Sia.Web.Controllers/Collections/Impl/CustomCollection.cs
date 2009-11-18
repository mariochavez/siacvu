using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections.Impl
{
    public class CustomCollection : ICustomCollection
    {
        public CustomSelectForm[] TipoProductoCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Con arbitraje"},
                           new CustomSelectForm {Id = 2, Nombre = "Sin arbitraje"}
                       };
        }

        public CustomSelectForm[] EstadoProductoCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Aceptado"},
                           new CustomSelectForm {Id = 2, Nombre = "Publicado"}
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

        public CustomSelectForm[] VolumenCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "I"},
                           new CustomSelectForm {Id = 2, Nombre = "II"},
                           new CustomSelectForm {Id = 3, Nombre = "III"},
                           new CustomSelectForm {Id = 4, Nombre = "IV"}
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

        public CustomSelectForm[] TipoAlumnoCursoCustomCollection()
        {
            return new[]
                       {
                           new CustomSelectForm {Id = 1, Nombre = "Interno"},
                           new CustomSelectForm {Id = 2, Nombre = "Externo"}
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
    }
}