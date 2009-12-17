using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers
{
    public class IndexValueHelper
    {
        public static string GetCursoIndexStringValue(CursoForm curso)
        {
            var indexValue = "";

            if(curso.Nombre != "")
                indexValue = curso.Nombre;
            if(curso.CursoInvestigadorNombre != "")
                indexValue = curso.CursoInvestigadorNombre;

            return indexValue;
        }

        public static string GetTesisIndexStringValue(TesisDirigidaForm tesisDirigida)
        {
            return tesisDirigida.Titulo != "" ? tesisDirigida.Titulo : tesisDirigida.TesisPosgrado.Titulo;
        }
    }
}