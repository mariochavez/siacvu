using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface ICursoService
    {
        Curso GetCursoById(int id);
        Curso[] GetAllCursos();
        Curso[] GetActiveCursos();
        void SaveCurso(Curso curso);
        void SaveCurso(Curso curso, bool commit);
	    Curso[] GetAllCursos(Usuario usuario);
    }
}
