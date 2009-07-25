using System;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface ICatalogoService
    {
        //Cargo
        Cargo GetCargoById(int id);
        Cargo[] GetAllCargos();
        void SaveCargo(Cargo cargo);

        //Departamento
        Departamento GetDepartamentoById(int id);
        Departamento[] GetAllDepartamentos();
        void SaveDepartamento(Departamento departamento);

        //Puesto
        Puesto GetPuestoById(int id);
        Puesto[] GetAllPuestos();
        void SavePuesto(Puesto puesto);

        //Sede
        Sede GetSedeById(int id);
        Sede[] GetAllSedes();
        void SaveSede(Sede sede);

        //Categoria
        Categoria GetCategoriaById(int id);
        Categoria[] GetAllCategorias();
        void SaveCategoria(Categoria categoria);

        //Grado Academico
        GradoAcademico GetGradoAcademicoById(int id);
        GradoAcademico[] GetAllGradoAcademicos();
        void SaveGradoAcademico(GradoAcademico gradoAcademico);

        //Sistema Nacional de Investigadores(SNI)
        SNI GetSNIById(int id);
        SNI[] GetAllSNIs();
        void SaveSNI(SNI sNI);
    }
}