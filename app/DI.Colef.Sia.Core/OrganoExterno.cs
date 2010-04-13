using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [HasUniqueDomainSignature]
    [OrganoExternoValidator]
    public class OrganoExterno : Entity, IBaseEntity
    {
        const int tipoProducto = 8; // 8 Representa Organo Externo

        public OrganoExterno()
        {
            ArchivosOrganoExterno = new List<ArchivoOrganoExterno>();
        }

        public virtual int TipoProducto { get { return tipoProducto; } }
        
        public virtual IList<ArchivoOrganoExterno> ArchivosOrganoExterno { get; private set; }

        public virtual void AddArchivo(Archivo archivo)
        {
            archivo.TipoProducto = tipoProducto;
            ArchivosOrganoExterno.Add((ArchivoOrganoExterno) archivo);
        }

        public virtual void DeleteArchivo(Archivo archivo)
        {
            ArchivosOrganoExterno.Remove((ArchivoOrganoExterno) archivo);
        }

        [Valid]
        public virtual Firma Firma { get; set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual Departamento Departamento { get; set; }

        public virtual Sede Sede { get; set; }

        [DomainSignature]
        [NotNullNotEmpty]
        public virtual string Nombre { get; set; }

        public virtual string Participacion { get; set; }

        public virtual DateTime FechaInicial { get; set; }

        public virtual DateTime FechaFinal { get; set; }
        
        public virtual string Siglas { get; set; }

        public virtual TipoOrgano TipoOrgano { get; set; }

        public virtual Sector Sector { get; set; }

        public virtual Ambito Ambito { get; set; }

        public virtual string Ciudad { get; set; }

        public virtual Pais Pais { get; set; }

        public virtual decimal Puntos { get; set; }

        public virtual Usuario CreadoPor { get; set; }

        public virtual DateTime CreadoEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}