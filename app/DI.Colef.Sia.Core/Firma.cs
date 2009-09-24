using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
	public class Firma : Entity, IBaseEntity
    {	
		public virtual int TipoProducto { get; set; }

		public virtual int Producto { get; set; }

		public virtual DateTime Firma1 { get; set; }

		public virtual int Aceptacion1 { get; set; }

		public virtual Usuario Usuario1 { get; set; }

		public virtual DateTime Firma2 { get; set; }

		public virtual int Aceptacion2 { get; set; }

		public virtual Usuario Usuario2 { get; set; }

		public virtual DateTime Firma3 { get; set; }

		public virtual int Aceptacion3 { get; set; }

		public virtual Usuario Usuario3 { get; set; }

		public virtual Usuario CreadorPor { get; set; }

		public virtual DateTime CreadorEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}
