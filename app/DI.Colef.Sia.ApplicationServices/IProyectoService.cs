using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IProyectoService
    {
        Proyecto GetProyectoById(int id);
        Proyecto[] GetAllProyectos();
	    Proyecto[] GetAllProyectos(Usuario currentUser);
        Proyecto[] GetActiveProyectos();
	    void SaveProyecto(Proyecto proyecto);
        void SaveProyecto(Proyecto proyecto, bool commit);
    }
}
