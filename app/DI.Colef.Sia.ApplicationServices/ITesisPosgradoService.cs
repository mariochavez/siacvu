using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface ITesisPosgradoService
    {
        TesisPosgrado GetTesisPosgradoById(int id);
        TesisPosgrado[] GetAllTesisPosgrados();
    }
}