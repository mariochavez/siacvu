using System;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public interface IBaseEntity
    {
        Usuario CreadorPor { get; set; }
        DateTime CreadorEl { get; set; }

        Usuario ModificadoPor { get; set; }
        DateTime ModificadoEl { get; set; }

        bool Activo { get; set; }
    }
}
