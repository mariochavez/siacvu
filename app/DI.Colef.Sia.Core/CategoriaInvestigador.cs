using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [CategoriaInvestigadorValidator]
    public class CategoriaInvestigador : Entity, IBaseEntity
    {
        public virtual DateTime FechaInicial { get; set; }

        public virtual DateTime FechaFinal { get; set; }

        [NotNull]
        public virtual Categoria Categoria { get; set; }

        public virtual Usuario CreadoPor { get; set; }

        public virtual DateTime CreadoEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}