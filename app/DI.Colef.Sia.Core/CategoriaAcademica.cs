using System;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class CategoriaAcademica : Entity, IBaseEntity
    {
        public virtual DateTime Fecha { get; set; }

        public virtual Categoria Categoria { get; set; }

        public virtual string CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual string ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}