using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [EditorialProductoValidator]
    public class EditorialProducto : Entity, IBaseEntity
    {
        public virtual Editorial Editorial { get; set; }

        public virtual int TipoProducto { get; set; }

        public virtual Usuario CreadoPor { get; set; }

        public virtual DateTime CreadoEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }

        public virtual string EditorialNombre { get; set; }

        public virtual Pais Pais { get; set; }
    }

    public class EditorialCapitulo : EditorialProducto
    {

    }

    public class EditorialLibro : EditorialProducto
    {

    }

    public class EditorialResena : EditorialProducto
    {

    }

    public class EditorialObraTraducida : EditorialProducto
    {

    }

    public class EditorialDictamen : EditorialProducto
    {

    }
}