using System;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public interface IBaseEntity
    {
        Usuario CreadoPor { get; set; }
        DateTime CreadoEl { get; set; }

        Usuario ModificadoPor { get; set; }
        DateTime ModificadoEl { get; set; }

        bool Activo { get; set; }
    }
}
