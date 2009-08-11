using System;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IMovilidadAcademicaService
    {
        MovilidadAcademica GetMovilidadAcademicaById(int id);
        MovilidadAcademica[] GetAllMovilidadAcademicas();
        MovilidadAcademica[] GetActiveMovilidadAcademicas();
        void SaveMovilidadAcademica(MovilidadAcademica movilidadAcademica);
    }
}
