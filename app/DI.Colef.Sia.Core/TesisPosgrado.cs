using System;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class TesisPosgrado : Entity
    {
        public virtual string Titulo { get; set; }

        public virtual VinculacionAPyD VinculacionAPyD { get; set; }

        public virtual int FormaParticipacion { get; set; }

        public virtual string NombreAlumno { get; set; }

        public virtual ProgramaEstudio ProgramaEstudio { get; set; }

        public virtual GradoAcademico GradoAcademico { get; set; }

        public virtual DateTime FechaGrado { get; set; }

        public virtual Institucion Institucion { get; set; }

        public virtual Sector Sector { get; set; }

        public virtual Organizacion Organizacion { get; set; }

        public virtual Nivel Nivel2 { get; set; }

        public virtual Area Area { get; set; }

        public virtual Disciplina Disciplina { get; set; }

        public virtual Subdisciplina Subdisciplina { get; set; }
    }
}