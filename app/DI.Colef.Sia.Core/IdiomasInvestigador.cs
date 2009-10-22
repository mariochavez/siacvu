using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [IdiomasInvestigadorValidator]
    public class IdiomasInvestigador : Entity, IBaseEntity
    {
        public virtual Idioma Idioma { get; set; }

        public virtual string LenguaMaterna { get; set; }

        public virtual bool Traductor { get; set; }

        public virtual bool Profesor { get; set; }

        public virtual int NivelConversacion { get; set; }

        public virtual int NivelLectura { get; set; }

        public virtual int NivelEscritura { get; set; }

        public virtual DateTime FechaEvaluacion { get; set; }

        public virtual string NombreDocumentoProbatorio { get; set; }

        public virtual int Puntuacion { get; set; }

        public virtual Usuario Usuario { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}
