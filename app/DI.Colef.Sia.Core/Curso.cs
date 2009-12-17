using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [CursoValidator]
    public class Curso : Entity, IBaseEntity
    {
        const int tipoProducto = 3; // 3 Representa Curso

        public virtual int TipoProducto { get { return tipoProducto; } }

        [Valid]
        public virtual Archivo ComprobanteCurso { get; set; }

        [Valid]
        public virtual Firma Firma { get; set; }

        public virtual int TipoCurso { get; set; }

        public virtual NivelEstudio NivelEstudio { get; set; }

        public virtual string ProgramaEstudio { get; set; }

        public virtual string Nombre { get; set; }

        public virtual CursoInvestigador CursoInvestigador { get; set; }

        public virtual Institucion Institucion { get; set; }
        
        public virtual DateTime FechaInicial { get; set; }

        public virtual DateTime FechaFinal { get; set; }

        public virtual int NumeroHoras { get; set; }

        public virtual Sector Sector { get; set; }

        public virtual Organizacion Organizacion { get; set; }

        public virtual Nivel Nivel2 { get; set; }

        public virtual Area Area { get; set; }

        public virtual Disciplina Disciplina { get; set; }

        public virtual Subdisciplina Subdisciplina { get; set; }

        public virtual decimal Puntuacion { get; set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual Departamento Departamento { get; set; }

        public virtual Sede Sede { get; set; }

        public virtual Usuario CreadoPor { get; set; }

        public virtual DateTime CreadoEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}