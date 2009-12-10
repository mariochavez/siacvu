using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IProyectoService
    {
        Proyecto GetProyectoById(int id);
        Proyecto[] GetAllProyectos();
        Proyecto[] GetActiveProyectos();
        void SaveProyecto(Proyecto proyecto, bool useCommit);
    }
}
