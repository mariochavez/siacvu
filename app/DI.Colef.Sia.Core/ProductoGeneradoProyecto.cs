using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [ProductoGeneradoProyectoValidator]
    public class ProductoGeneradoProyecto : Entity, IBaseEntity
    {
        public virtual int ProductoGenerado { get; set; } //Catalogo Fijo

        public virtual DateTime FechaEntrega { get; set; }

        //Adjunte documento falta

        public virtual Usuario CreadoPor { get; set; }

        public virtual DateTime CreadoEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}