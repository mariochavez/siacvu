using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface IFirmaService
    {
        Firma GetFirmaById(int id);
        void SaveFirma(Firma firma);
    }
}
