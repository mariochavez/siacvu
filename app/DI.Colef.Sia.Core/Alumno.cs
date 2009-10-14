using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class Alumno : Entity
    {
        public virtual string Nombre { get; set; }

        public virtual ProgramaEstudio ProgramaEstudio { get; set; }

        public virtual GradoAcademico GradoAcademico { get; set; }
    }
}