using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices.Impl
{
    public class CurriculumService : ICurriculumService
    {
        readonly ICurriculumQuerying curriculumQuerying;

        public CurriculumService(ICurriculumQuerying curriculumQuerying)
        {
            this.curriculumQuerying = curriculumQuerying;
        }

        public object [] GetListaProductos(Usuario usuario)
        {
            return curriculumQuerying.GetListaProductos(usuario);
        }
    }
}
