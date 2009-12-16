using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IOrganoInternoService
    {
        OrganoInterno GetOrganoInternoById(int id);
        OrganoInterno[] GetAllOrganoInternos();
        OrganoInterno[] GetActiveOrganoInternos();
        void SaveOrganoInterno(OrganoInterno organoInterno);
        void SaveOrganoInterno(OrganoInterno organoInterno, bool commit);
        OrganoInterno[] GetAllOrganoInternos(Usuario usuario);
    }
}