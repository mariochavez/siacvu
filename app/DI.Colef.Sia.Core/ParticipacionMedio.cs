using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [HasUniqueDomainSignature]
    [ParticipacionMedioValidator]
    public class ParticipacionMedio : Entity, IBaseEntity
    {
        const int tipoProducto = 10; // 10 Representa Participacion en Medios

        public ParticipacionMedio()
        {
            ArchivoParticipacionMedios = new List<ArchivoParticipacionMedio>();
            FirmaParticipacionMedios = new List<FirmaParticipacionMedio>();
        }

        public virtual void AddArchivo(Archivo archivo)
        {
            archivo.TipoProducto = tipoProducto;
            ArchivoParticipacionMedios.Add((ArchivoParticipacionMedio) archivo);
        }

        public virtual void AddFirma(Firma firma)
        {
            firma.TipoProducto = tipoProducto;
            FirmaParticipacionMedios.Add((FirmaParticipacionMedio)firma);
        }

        public virtual void DeleteFirma(Firma firma)
        {
            FirmaParticipacionMedios.Remove((FirmaParticipacionMedio)firma);
        }

        public virtual void DeleteArchivo(Archivo archivo)
        {
            ArchivoParticipacionMedios.Remove((ArchivoParticipacionMedio) archivo);
        }

        [Valid]
        public virtual IList<ArchivoParticipacionMedio> ArchivoParticipacionMedios { get; private set; }

        [Valid]
        public virtual IList<FirmaParticipacionMedio> FirmaParticipacionMedios { get; private set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual Departamento Departamento { get; set; }

        public virtual Sede Sede { get; set; }

		public virtual TipoParticipacion TipoParticipacion { get; set; }

        [DomainSignature]
        [NotNullNotEmpty]
        public virtual string Titulo { get; set; }

        public virtual string PalabraClave1 { get; set; }

        public virtual string PalabraClave2 { get; set; }

        public virtual string PalabraClave3 { get; set; }

        public virtual AreaTematica AreaTematica { get; set; }
		
		public virtual string Institucion { get; set; }

        public virtual Ambito Ambito { get; set; }

        public virtual DirigidoA DirigidoA { get; set; }

        public virtual string LugarPresentacion { get; set; }

        public virtual DateTime FechaPresentacion { get; set; }
        
        public virtual int Puntuacion { get; set; }
        
        public virtual Usuario CreadoPor { get; set; }

		public virtual DateTime CreadoEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}