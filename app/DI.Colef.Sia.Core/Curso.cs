using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [CursoValidator]
    [HasUniqueDomainSignature]
    public class Curso : Entity, IBaseEntity
    {
        const int tipoProducto = 3; // 3 Representa Curso

        public Curso()
        {
            ArchivoCursos = new List<ArchivoCurso>();
            FirmaCursos = new List<FirmaCurso>();
        }

        public virtual void AddArchivo(Archivo archivo)
        {
            archivo.TipoProducto = tipoProducto;
            ArchivoCursos.Add((ArchivoCurso) archivo);
        }

        public virtual void AddFirma(Firma firma)
        {
            firma.TipoProducto = tipoProducto;
            FirmaCursos.Add((FirmaCurso)firma);
        }

        public virtual void DeleteFirma(Firma firma)
        {
            FirmaCursos.Remove((FirmaCurso)firma);
        }

        public virtual void DeleteArchivo(Archivo archivo)
        {
            ArchivoCursos.Remove((ArchivoCurso) archivo);
        }

        [Valid]
        public virtual IList<ArchivoCurso> ArchivoCursos { get; private set; }

        [Valid]
        public virtual IList<FirmaCurso> FirmaCursos { get; private set; }

        public virtual int TipoCurso { get; set; }

        public virtual bool EsDiplomado { get; set; }

        public virtual string NombreDiplomado { get; set; }

        public virtual Diplomado Diplomado { get; set; }

        public virtual NivelEstudio NivelEstudio { get; set; }

        public virtual ProgramaEstudio ProgramaEstudio { get; set; }

        [DomainSignature]
        public virtual string Nombre { get; set; }

        public virtual Institucion Institucion { get; set; }
        
        public virtual DateTime FechaInicial { get; set; }

        public virtual DateTime FechaFinal { get; set; }

        public virtual int NumeroHoras { get; set; }

        public virtual Nivel Nivel2 { get; set; }

        public virtual Pais Pais { get; set; }

        public virtual Subdisciplina Subdisciplina { get; set; }

        public virtual int Puntuacion { get; set; }

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
