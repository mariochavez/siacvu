using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections
{
    public interface ICustomCollection
    {
        CustomSelectForm[] TipoProductoCustomCollection();
        CustomSelectForm[] EstadoProductoCustomCollection();
        CustomSelectForm[] EdicionCustomCollection();
        CustomSelectForm[] ReimpresionCustomCollection();
        CustomSelectForm[] NivelIdiomaCustomCollection();
        CustomSelectForm[] TipoTesisCustomCollection();
        CustomSelectForm[] TipoCursoCustomCollection();
        CustomSelectForm[] PeriodoCustomCollection();
        CustomSelectForm[] TipoRevistaCustomCollection();
        CustomSelectForm[] PeriodicidadCustomCollection();
        CustomSelectForm[] ClasificacionSievaCustomCollection();
        CustomSelectForm[] FormatoRevistaCustomCollection();
        CustomSelectForm[] SectorCustomCollection();
        CustomSelectForm[] TipoParticipacionCustomCollection();
        CustomSelectForm[] TipoProductoCustomCollection(int tipoProducto);
        CustomSelectForm[] TipoLibroCustomCollection();
        CustomSelectForm[] FormatoPublicacionCustomCollection();
        CustomSelectForm[] ContenidoLibroCustomCollection();
        CustomSelectForm[] TipoReporteCustomCollection();
        CustomSelectForm[] TipoResenaCustomCollection();
        CustomSelectForm[] FormaParticipacionCustomCollection();
        CustomSelectForm[] EstadoProyectoCustomCollection();
    }
}