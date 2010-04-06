using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [OrganoInternoValidator]
    public class OrganoInterno : Entity, IBaseEntity
    {
        const int tipoProducto = 14; // 14 Representa Organo Interno

        public OrganoInterno()
        {
            ArchivosOrganoInterno = new List<ArchivoOrganoInterno>();
        }

        public virtual int TipoProducto { get { return tipoProducto; } }
        
        public virtual IList<ArchivoOrganoInterno> ArchivosOrganoInterno { get; private set; }

        public virtual void AddArchivo(Archivo archivo)
        {
            archivo.TipoProducto = tipoProducto;
            ArchivosOrganoInterno.Add((ArchivoOrganoInterno) archivo);
        }

        public virtual void DeleteArchivo(Archivo archivo)
        {
            ArchivosOrganoInterno.Remove((ArchivoOrganoInterno) archivo);
        }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        [NotNull]
        public virtual Investigador Investigador { get; set; }

        public virtual Departamento Departamento { get; set; }

        public virtual Sede Sede { get; set; }

		public virtual ConsejoComision ConsejoComision { get; set; }

		public virtual DateTime FechaInicial { get; set; }

		public virtual DateTime FechaFinal { get; set; }

		public virtual int Periodo { get; set; }

		public virtual Usuario CreadoPor { get; set; }

		public virtual DateTime CreadoEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}