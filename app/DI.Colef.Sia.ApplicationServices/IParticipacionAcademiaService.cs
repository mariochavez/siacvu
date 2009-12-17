using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IParticipacionAcademiaService
    {
        ParticipacionAcademia GetParticipacionAcademiaById(int id);
        ParticipacionAcademia[] GetAllParticipacionAcademias();
        ParticipacionAcademia[] GetActiveParticipacionAcademias();
        void SaveParticipacionAcademia(ParticipacionAcademia participacionAcademia);
	    ParticipacionAcademia[] GetAllParticipacionAcademias(Usuario usuario);
    }
}
