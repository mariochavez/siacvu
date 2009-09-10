using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IOrganoExternoService
    {
        OrganoExterno GetOrganoExternoById(int id);
        OrganoExterno[] GetAllOrganoExternos();
        OrganoExterno[] GetActiveOrganoExternos();
        void SaveOrganoExterno(OrganoExterno organoExterno);
	    OrganoExterno[] GetAllOrganoExternos(Usuario usuario);
    }
}
