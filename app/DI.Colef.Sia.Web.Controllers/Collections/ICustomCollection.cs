using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections
{
    public interface ICustomCollection
    {
        CustomSelectForm[] TipoProductoCustomCollection();
        CustomSelectForm[] EstadoProductoCustomCollection();
        CustomSelectForm[] EdicionCustomCollection();
        CustomSelectForm[] ReimpresionCustomCollection();
        CustomSelectForm[] VolumenCustomCollection();
        CustomSelectForm[] NivelIdiomaCustomCollection();
        CustomSelectForm[] TipoAlumnoCursoCustomCollection();
        CustomSelectForm[] PeriodoCustomCollection();
        CustomSelectForm[] TipoRevistaCustomCollection();
        CustomSelectForm[] PeriodicidadCustomCollection();
        CustomSelectForm[] ClasificacionSievaCustomCollection();
        CustomSelectForm[] FormatoRevistaCustomCollection();
    }
}