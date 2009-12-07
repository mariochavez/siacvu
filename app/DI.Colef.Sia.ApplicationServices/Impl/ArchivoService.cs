using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class ArchivoService : IArchivoService
    {
        readonly IRepository<ArchivoEstado> archivoEstadoRepository;
        readonly IRepository<ArchivoGradoAcademico> archivoGradoAcademicoRepository;
        readonly IRepository<ArchivoCargo> archivoCargoRepository;
        readonly IRepository<ArchivoCategoria> archivoCategoriaRepository;
        readonly IRepository<ArchivoSni> archivoSniRepository;

        public ArchivoService(IRepository<ArchivoEstado> archivoEstadoRepository, 
            IRepository<ArchivoGradoAcademico> archivoGradoAcademicoRepository,
            IRepository<ArchivoCargo> archivoCargoRepository,
            IRepository<ArchivoCategoria> archivoCategoriaRepository,
            IRepository<ArchivoSni> archivoSniRepository)
        {
            this.archivoEstadoRepository = archivoEstadoRepository;
            this.archivoGradoAcademicoRepository = archivoGradoAcademicoRepository;
            this.archivoCargoRepository = archivoCargoRepository;
            this.archivoCategoriaRepository = archivoCategoriaRepository;
            this.archivoSniRepository = archivoSniRepository;
        }

        public void SaveEstado(ArchivoEstado archivo)
        {
            archivo.TipoProducto = 50; // 50 Representa EstadoInvestigador
            archivoEstadoRepository.SaveOrUpdate(archivo);
        }

        public void SaveGradoAcademico(ArchivoGradoAcademico archivo)
        {
            archivo.TipoProducto = 51; // 51 Representa GradoAcademicoInvestigador
            archivoGradoAcademicoRepository.SaveOrUpdate(archivo);
        }

        public void SaveCargo(ArchivoCargo archivo)
        {
            archivo.TipoProducto = 52; // 52 Representa CargoInvestigador
            archivoCargoRepository.SaveOrUpdate(archivo);
        }

        public void SaveCategoria(ArchivoCategoria archivo)
        {
            archivo.TipoProducto = 53; // 53 Representa CategoriaInvestigador
            archivoCategoriaRepository.SaveOrUpdate(archivo);
        }

        public void SaveSni(ArchivoSni archivo)
        {
            archivo.TipoProducto = 54; // 54 Representa SniInvestigador
            archivoSniRepository.SaveOrUpdate(archivo);
        }
    }
}
