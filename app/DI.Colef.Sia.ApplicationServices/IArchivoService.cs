using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface IArchivoService
    {
        void SaveEstado(ArchivoEstado archivo);
        void SaveGradoAcademico(ArchivoGradoAcademico archivo);
        void SaveCargo(ArchivoCargo archivo);
        void SaveCategoria(ArchivoCategoria archivo);
        void SaveSni(ArchivoSni archivo);
    }
}
