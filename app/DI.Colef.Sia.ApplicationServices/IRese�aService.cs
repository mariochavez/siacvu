using System;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
	public interface IReseñaService
    {
        Reseña GetReseñaById(int id);
        Reseña[] GetAllReseñas();
        Reseña[] GetActiveReseñas();
        void SaveReseña(Reseña reseña);
    }
}
