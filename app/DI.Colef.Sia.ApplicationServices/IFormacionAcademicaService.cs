using System;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IFormacionAcademicaService
    {
        FormacionAcademica GetFormacionAcademicaById(int id);
        FormacionAcademica[] GetAllFormacionAcademicas();
        FormacionAcademica[] GetActiveFormacionAcademicas();
        void SaveFormacionAcademica(FormacionAcademica formacionAcademica);
    }
}
