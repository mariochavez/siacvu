using System;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IRevistaPublicacionService
    {
        RevistaPublicacion GetRevistaPublicacionById(int id);
        RevistaPublicacion[] GetAllRevistaPublicacions();
        void SaveRevistaPublicacion(RevistaPublicacion revistaPublicacion);
    }
}
