using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;
using System.Collections.Generic;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [HasUniqueDomainSignature]
    [GrupoInvestigacionValidator]
    public class GrupoInvestigacion : Entity, IBaseEntity
    {
        [NotNull]
		public virtual Usuario Usuario { get; set; }
		
		[NotNullNotEmpty]
        [DomainSignature]
		public virtual string NombreGrupoInvestigacion { get; set; }

		public virtual DateTime FechaCreacion { get; set; }

		public virtual Sector Sector { get; set; }

		public virtual Organizacion Organizacion { get; set; }

		public virtual Nivel Nivel2 { get; set; }

		public virtual Nivel Nivel3 { get; set; }

		public virtual Nivel Nivel4 { get; set; }

		public virtual Nivel Nivel5 { get; set; }

		public virtual Nivel Nivel6 { get; set; }

		public virtual bool Lider { get; set; }

		public virtual string Nombre { get; set; }

		public virtual string Miembros { get; set; }

		public virtual string Impacto { get; set; }

		public virtual string VinculacionSectorProductivo { get; set; }

		public virtual string VinculacionSectorSocial { get; set; }

		public virtual string Colaboracion { get; set; }

		public virtual string Administracion { get; set; }

		public virtual string ProgramaRegistrado { get; set; }

		public virtual Usuario CreadorPor { get; set; }

		public virtual DateTime CreadorEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}
