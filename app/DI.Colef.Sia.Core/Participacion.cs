using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [HasUniqueDomainSignature]
    [ParticipacionValidator]
    public class Participacion : Entity, IBaseEntity
    {
        const int tipoProducto = 9; // 9 Representa Participacion

        public Participacion()
        {
            ArchivoParticipaciones = new List<ArchivoParticipacion>();
            FirmaParticipaciones = new List<FirmaParticipacion>();
        }

        public virtual void AddArchivo(Archivo archivo)
        {
            archivo.TipoProducto = tipoProducto;
            ArchivoParticipaciones.Add((ArchivoParticipacion) archivo);
        }

        public virtual void AddFirma(Firma firma)
        {
            firma.TipoProducto = tipoProducto;
            FirmaParticipaciones.Add((FirmaParticipacion)firma);
        }

        public virtual void DeleteFirma(Firma firma)
        {
            FirmaParticipaciones.Remove((FirmaParticipacion)firma);
        }

        public virtual void DeleteArchivo(Archivo archivo)
        {
            ArchivoParticipaciones.Remove((ArchivoParticipacion) archivo);
        }

        [Valid]
        public virtual IList<ArchivoParticipacion> ArchivoParticipaciones { get; private set; }

        [Valid]
        public virtual IList<FirmaParticipacion> FirmaParticipaciones { get; private set; }

        [DomainSignature]
		[NotNullNotEmpty]
		public virtual string Titulo { get; set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual Departamento Departamento { get; set; }

        public virtual Sede Sede { get; set; }

        public virtual int Puntuacion { get; set; }

		public virtual Investigador Autor { get; set; }

		public virtual OtraParticipacion OtraParticipacion { get; set; }

		public virtual TipoPresentacion TipoPresentacion { get; set; }

		public virtual Institucion Institucion { get; set; }

		public virtual DateTime FechaPresentacion { get; set; }
        
		public virtual PeriodoReferencia PeriodoReferencia { get; set; }

		public virtual Proyecto Proyecto { get; set; }

		public virtual string Lugar { get; set; }

		public virtual Pais Pais { get; set; }

		public virtual EstadoPais EstadoPais { get; set; }

		public virtual string Ciudad { get; set; }

		public virtual Usuario CreadorPor { get; set; }

		public virtual DateTime CreadorEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}
