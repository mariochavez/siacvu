using System;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class CursoInvestigador : Entity
    {
        public virtual string Nombre { get; set; }

        public virtual string NombreInvestigador { get; set; }

        public virtual ProgramaEstudio ProgramaEstudio { get; set; }

        public virtual Institucion Institucion { get; set; }

        public virtual DateTime FechaInicial { get; set; }

        public virtual DateTime FechaFinal { get; set; }

        public virtual int NumeroHoras { get; set; }
    }
}