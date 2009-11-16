using System;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class TesisPosgrado : Entity
    {
        public virtual string Titulo { get; set; }

        public virtual VinculacionAPyD VinculacionAPyD { get; set; }

        public virtual FormaParticipacion FormaParticipacion { get; set; }

        public virtual string NombreAlumno { get; set; }

        public virtual ProgramaEstudio ProgramaEstudio { get; set; }

        public virtual GradoAcademico GradoAcademico { get; set; }

        public virtual DateTime FechaGrado { get; set; }
    }
}