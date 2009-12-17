using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [FirmaValidator]
	public class Firma : Entity, IBaseEntity
    {
		public virtual int TipoProducto { get; set; }

		public virtual DateTime Firma1 { get; set; }

		public virtual int Aceptacion1 { get; set; }

		public virtual Usuario Usuario1 { get; set; }

		public virtual DateTime Firma2 { get; set; }

		public virtual int Aceptacion2 { get; set; }

		public virtual Usuario Usuario2 { get; set; }

		public virtual DateTime Firma3 { get; set; }

		public virtual int Aceptacion3 { get; set; }

		public virtual Usuario Usuario3 { get; set; }

        public virtual int PuntuacionSieva { get; set; }

	    public virtual string Descripcion { get; set; }

		public virtual Usuario CreadoPor { get; set; }

		public virtual DateTime CreadoEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}