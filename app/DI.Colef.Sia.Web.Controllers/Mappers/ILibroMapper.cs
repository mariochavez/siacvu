using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface ILibroMapper : IMapper<Libro, LibroForm>
    {
        Libro Map(LibroForm message, Usuario usuario, PeriodoReferencia periodo, Investigador investigador);

        Libro Map(LibroForm message, Usuario usuario, PeriodoReferencia periodo, Investigador investigador,
                  CoautorExternoProductoForm[] coautoresExternos, CoautorInternoProductoForm[] coautoresInternos,
                  EditorialLibroForm[] editoriales);
    }
}
