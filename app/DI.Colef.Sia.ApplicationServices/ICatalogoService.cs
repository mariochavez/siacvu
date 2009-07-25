using System;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface ICatalogoService
    {
        Cargo GetCargoById(int id);
        Cargo[] GetAllCargos();
        void SaveCargo(Cargo cargo);

        Departamento GetDepartamentoById(int id);
        Departamento[] GetAllDepartamentos();
        void SaveDepartamento(Departamento departamento);

        Puesto GetPuestoById(int id);
        Puesto[] GetAllPuestos();
        void SavePuesto(Puesto puesto);

        Sede GetSedeById(int id);
        Sede[] GetAllSedes();
        void SaveSede(Sede sede);
    }
}