using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IExperienciaProfesionalService
    {
        ExperienciaProfesional GetExperienciaProfesionalById(int id);
        ExperienciaProfesional[] GetAllExperienciasProfesionales();
        ExperienciaProfesional[] GetActiveExperienciasProfesionales();
        void SaveExperienciaProfesional(ExperienciaProfesional experienciaProfesional);
    }
}
