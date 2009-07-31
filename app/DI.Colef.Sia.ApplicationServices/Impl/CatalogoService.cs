using System;
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
        readonly IRepository<SNI> sniRepository;
        readonly IRepository<Estado> estadoRepository;

        public CatalogoService(IRepository<Cargo> cargoRepository, IRepository<Departamento> departamentoRepository, 
            IRepository<Puesto> puestoRepository, IRepository<Sede> sedeRepository, IRepository<Categoria> categoriaRepository, 
            IRepository<GradoAcademico> gradoAcademicoRepository, IRepository<SNI> sniRepository, IRepository<Estado> estadoRepository)
        {
            this.cargoRepository = cargoRepository;
            this.departamentoRepository = departamentoRepository;
            this.puestoRepository = puestoRepository;
            this.sedeRepository = sedeRepository;
            this.categoriaRepository = categoriaRepository;
            this.gradoAcademicoRepository = gradoAcademicoRepository;
            this.sniRepository = sniRepository;
            this.estadoRepository = estadoRepository;
        }

        public Cargo GetCargoById(int id)
        {
            return cargoRepository.Get(id);
        }

        public Cargo[] GetAllCargos()
        {
            return ((List<Cargo>)cargoRepository.GetAll()).ToArray();
        }

        public Cargo[] GetActiveCargos()
        {
            return ((List<Cargo>)cargoRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveCargo(Cargo cargo)
        {
            if (cargo.Id == 0)
            {
                cargo.Activo = true;
                cargo.CreadorEl = DateTime.Now;
            }
            cargo.ModificadoEl = DateTime.Now;

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

        public Departamento[] GetActiveDepartamentos()
        {
            return ((List<Departamento>)departamentoRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveDepartamento(Departamento departamento)
        {
            if (departamento.Id == 0)
            {
                departamento.Activo = true;
                departamento.CreadorEl = DateTime.Now;
            }
            departamento.ModificadoEl = DateTime.Now;

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
            if (puesto.Id == 0)
            {
                puesto.Activo = true;
                puesto.CreadorEl = DateTime.Now;
            }
            puesto.ModificadoEl = DateTime.Now;

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

        public Sede[] GetActiveSedes()
        {
            return ((List<Sede>)sedeRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveSede(Sede sede)
        {
            if (sede.Id == 0)
            {
                sede.Activo = true;
                sede.CreadorEl = DateTime.Now;
            }
            sede.ModificadoEl = DateTime.Now;

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

        public Categoria[] GetActiveCategorias()
        {
            return ((List<Categoria>)categoriaRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveCategoria(Categoria categoria)
        {
            if (categoria.Id == 0)
            {
                categoria.Activo = true;
                categoria.CreadorEl = DateTime.Now;
            }
            categoria.ModificadoEl = DateTime.Now;

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

        public GradoAcademico[] GetActiveGrados()
        {
            return ((List<GradoAcademico>)gradoAcademicoRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveGradoAcademico(GradoAcademico gradoAcademico)
        {
            if (gradoAcademico.Id == 0)
            {
                gradoAcademico.Activo = true;
                gradoAcademico.CreadorEl = DateTime.Now;
            }
            gradoAcademico.ModificadoEl = DateTime.Now;

            gradoAcademicoRepository.SaveOrUpdate(gradoAcademico);
        }

        public SNI GetSNIById(int id)
        {
            return sniRepository.Get(id);
        }

        public SNI[] GetAllSNIs()
        {
            return ((List<SNI>)sniRepository.GetAll()).ToArray();
        }

        public SNI[] GetActiveSNIs()
        {
            return ((List<SNI>)sniRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveSNI(SNI sni)
        {
            if (sni.Id == 0)
            {
                sni.Activo = true;
                sni.CreadorEl = DateTime.Now;
            }
            sni.ModificadoEl = DateTime.Now;

            sniRepository.SaveOrUpdate(sni);
        }

        public Estado GetEstadoById(int id)
        {
            return estadoRepository.Get(id);
        }

        public Estado[] GetAllEstados()
        {
            return ((List<Estado>)estadoRepository.GetAll()).ToArray();
        }

        public Estado[] GetActiveEstados()
        {
            return ((List<Estado>)estadoRepository.FindAll(new Dictionary<string, object> {{ "Activo", true}})).ToArray();
        }

        public void SaveEstado(Estado estado)
        {
            if (estado.Id == 0)
            {
                estado.Activo = true;
                estado.CreadorEl = DateTime.Now;
            }
            estado.ModificadoEl = DateTime.Now;

            estadoRepository.SaveOrUpdate(estado);
        }
    }
}
