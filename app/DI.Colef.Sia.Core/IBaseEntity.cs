using System;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public interface IBaseEntity
    {
        string CreadorPor { get; set; }
        DateTime CreadorEl { get; set; }

        string ModificadoPor { get; set; }
        DateTime ModificadoEl { get; set; }

        bool Activo { get; set; }
    }
}
