using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface IConvenioService
    {
        Convenio GetConvenioById(int id);
        Convenio[] GetAllConvenios();
    }
}