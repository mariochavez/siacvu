using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [TesisDirigidaValidator]
    public class TesisDirigida : Entity, IBaseEntity
    {
        const int tipoProducto = 13; // 13 Representa Tesis Dirigida

        public TesisDirigida()
        {
            ArchivoTesisDirigidas = new List<ArchivoTesisDirigida>();
            FirmaTesisDirigidas = new List<FirmaTesisDirigida>();
        }

        public virtual void AddArchivo(Archivo archivo)
        {
            archivo.TipoProducto = tipoProducto;
            ArchivoTesisDirigidas.Add((ArchivoTesisDirigida) archivo);
        }

        public virtual void AddFirma(Firma firma)
        {
            firma.TipoProducto = tipoProducto;
            FirmaTesisDirigidas.Add((FirmaTesisDirigida)firma);
        }

        public virtual void DeleteFirma(Firma firma)
        {
            FirmaTesisDirigidas.Remove((FirmaTesisDirigida)firma);
        }

        public virtual void DeleteArchivo(Archivo archivo)
        {
            ArchivoTesisDirigidas.Remove((ArchivoTesisDirigida) archivo);
        }

        [Valid]
        public virtual IList<ArchivoTesisDirigida> ArchivoTesisDirigidas { get; private set; }

        [Valid]
        public virtual IList<FirmaTesisDirigida> FirmaTesisDirigidas { get; private set; }

        public virtual int TipoTesis { get; set; }

        public virtual TesisPosgrado TesisPosgrado { get; set; }

		public virtual string Titulo { get; set; }

        public virtual ProgramaEstudio ProgramaEstudio { get; set; }

        public virtual DateTime FechaGrado { get; set; }

        public virtual VinculacionAPyD VinculacionAPyD { get; set; }

        public virtual int FormaParticipacion { get; set; }

        public virtual string NombreAlumno { get; set; }

        public virtual GradoAcademico GradoAcademico { get; set; }

        public virtual Institucion Institucion { get; set; }

        public virtual int Puntuacion { get; set; }

        public virtual Sector Sector { get; set; }

        public virtual Organizacion Organizacion { get; set; }

		public virtual Nivel Nivel2 { get; set; }

        public virtual Area Area { get; set; }

        public virtual Disciplina Disciplina { get; set; }

		public virtual Subdisciplina Subdisciplina { get; set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual Departamento Departamento { get; set; }

        public virtual Sede Sede { get; set; }

		public virtual Usuario CreadorPor { get; set; }

		public virtual DateTime CreadorEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}