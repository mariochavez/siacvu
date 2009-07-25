using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class CatalogoService : ICatalogoService
    {
        readonly IRepository<Cargo> cargoRepository;
        readonly IRepository<Departamento> departamentoRepository;
        readonly IRepository<Puesto> puestoRepository;
        readonly IRepository<Sede> sedeRepository;
        readonly IRepository<Categoria> categoriaRepository;
        readonly IRepository<GradoAcademico> gradoAcademicoRepository;
        readonly IRepository<SNI> sNIRepository;

        public CatalogoService(IRepository<Cargo> cargoRepository, IRepository<Departamento> departamentoRepository, IRepository<Puesto> puestoRepository, IRepository<Sede> sedeRepository, IRepository<Categoria> categoriaRepository, IRepository<GradoAcademico> gradoAcademicoRepository, IRepository<SNI> sNIRepository)
        {
            this.cargoRepository = cargoRepository;
            this.departamentoRepository = departamentoRepository;
            this.puestoRepository = puestoRepository;
            this.sedeRepository = sedeRepository;
            this.categoriaRepository = categoriaRepository;
            this.gradoAcademicoRepository = gradoAcademicoRepository;
            this.sNIRepository = sNIRepository;
        }

        public Cargo GetCargoById(int id)
        {
            return cargoRepository.Get(id);
        }

        public Cargo[] GetAllCargos()
        {
            return ((List<Cargo>)cargoRepository.GetAll()).ToArray();
        }

        public void SaveCargo(Cargo cargo)
        {
            cargoRepository.SaveOrUpdate(cargo);
        }

        public Departamento GetDepartamentoById(int id)
        {
            return departamentoRepository.Get(id);
        }

        public Departamento[] GetAllDepartamentos()
        {
            return ((List<Departamento>)departamentoRepository.GetAll()).ToArray();
        }

        public void SaveDepartamento(Departamento departamento)
        {
            departamentoRepository.SaveOrUpdate(departamento);
        }

        public Puesto GetPuestoById(int id)
        {
            return puestoRepository.Get(id);
        }

        public Puesto[] GetAllPuestos()
        {
            return ((List<Puesto>)puestoRepository.GetAll()).ToArray();
        }

        public void SavePuesto(Puesto puesto)
        {
            puestoRepository.SaveOrUpdate(puesto);
        }

        public Sede GetSedeById(int id)
        {
            return sedeRepository.Get(id);
        }

        public Sede[] GetAllSedes()
        {
            return ((List<Sede>)sedeRepository.GetAll()).ToArray();
        }

        public void SaveSede(Sede sede)
        {
            sedeRepository.SaveOrUpdate(sede);
        }

        public Categoria GetCategoriaById(int id)
        {
            return categoriaRepository.Get(id);
        }

        public Categoria[] GetAllCategorias()
        {
            return ((List<Categoria>)categoriaRepository.GetAll()).ToArray();
        }

        public void SaveCategoria(Categoria categoria)
        {
            categoriaRepository.SaveOrUpdate(categoria);
        }

        public GradoAcademico GetGradoAcademicoById(int id)
        {
            return gradoAcademicoRepository.Get(id);
        }

        public GradoAcademico[] GetAllGradoAcademicos()
        {
            return ((List<GradoAcademico>)gradoAcademicoRepository.GetAll()).ToArray();
        }

        public void SaveGradoAcademico(GradoAcademico gradoAcademico)
        {
            gradoAcademicoRepository.SaveOrUpdate(gradoAcademico);
        }

        public SNI GetSNIById(int id)
        {
            return sNIRepository.Get(id);
        }

        public SNI[] GetAllSNIs()
        {
            return ((List<SNI>)sNIRepository.GetAll()).ToArray();
        }

        public void SaveSNI(SNI sNI)
        {
            sNIRepository.SaveOrUpdate(sNI);
        }
    }
}
