using System;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class CargoAcademico : Entity, IBaseEntity
    {
        public virtual DateTime Fecha { get; set; }

        public virtual Cargo Cargo { get; set; }

        public virtual Departamento Departamento { get; set; }

        public virtual Sede Sede { get; set; }

        public virtual string CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual string ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}