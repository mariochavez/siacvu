using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using System.Collections.Generic;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class Proyecto : Entity, IBaseEntity
    {
        public Proyecto()
        {
            ResponsableInternoProyectos = new List<ResponsableInternoProyecto>();
            ResponsableExternoProyectos = new List<ResponsableExternoProyecto>();
            ParticipanteInternoProyectos = new List<ParticipanteInternoProyecto>();
            ParticipanteExternoProyectos = new List<ParticipanteExternoProyecto>();
        }

        public virtual void AddResponsableInterno(ResponsableInternoProyecto responsableInternoProyecto)
        {
            ResponsableInternoProyectos.Add(responsableInternoProyecto);
        }

        public virtual void AddResponsableExterno(ResponsableExternoProyecto responsableExternoProyecto)
        {
            ResponsableExternoProyectos.Add(responsableExternoProyecto);
        }

        public virtual void AddParticipanteInterno(ParticipanteInternoProyecto participanteInternoProyecto)
        {
            ParticipanteInternoProyectos.Add(participanteInternoProyecto);
        }

        public virtual void AddParticipanteExterno(ParticipanteExternoProyecto participanteExternoProyecto)
        {
            ParticipanteExternoProyectos.Add(participanteExternoProyecto);
        }

        public virtual TipoProyecto TipoProyecto { get; set; }

        public virtual string Nombre { get; set; }

        public virtual string Responsable { get; set; }

        public virtual LineaTematica LineaTematica { get; set; }

        public virtual DateTime FechaInicial { get; set; }

        public virtual DateTime FechaFinal { get; set; }

        public virtual DateTime FechaRegistro { get; set; }

        public virtual string ProductoEsperado { get; set; }

        public virtual Coordinacion Coordinacion { get; set; }

        public virtual bool ConFinanciamiento { get; set; }

        public virtual int EstadoProyecto { get; set; }

        public virtual DateTime FechaTramite { get; set; }

        public virtual string Objetivos { get; set; }

        public virtual IList<ResponsableInternoProyecto> ResponsableInternoProyectos { get; private set; }

        public virtual IList<ResponsableExternoProyecto> ResponsableExternoProyectos { get; private set; }

        public virtual IList<ParticipanteInternoProyecto> ParticipanteInternoProyectos { get; private set; }

        public virtual IList<ParticipanteExternoProyecto> ParticipanteExternoProyectos { get; private set; }

        //public virtual Convenio Convenio { get; set; }

        //public virtual bool ProyectoConvenio { get; set; }

        //public virtual Sede Sede { get; set; }

        //public virtual string ObjetivoGeneral { get; set; }

        //public virtual string ImpactoAcademico { get; set; }

        //public virtual ImpactoPoliticaPublica ImpactoPoliticaPublica { get; set; }

        //public virtual string OtroImpacto { get; set; }

        //public virtual Ambito Ambito { get; set; }

        //public virtual string UsuariosPotenciales { get; set; }

        //public virtual string BeneficiariosProyecto { get; set; }

        //public virtual TipoFinanciamiento TipoFinanciamiento { get; set; }

        //public virtual int Monto { get; set; }

        //public virtual Moneda Moneda { get; set; }

        //public virtual SectorFinanciamiento SectorFinanciamiento { get; set; }

        //public virtual DateTime FechaEntregaCompromiso { get; set; }

        //public virtual ProductoAcademico ProductoAcademico { get; set; }

        //public virtual ActividadPrevista ActividadPrevista { get; set; }

        //public virtual DateTime FechaEntregaProducto { get; set; }

        //public virtual bool ServicioUSEG { get; set; }

        //public virtual USEG USEG { get; set; }

        //public virtual string NombreEstudiante { get; set; }

        //public virtual int TipoEstudiante { get; set; }

        //public virtual Institucion Institucion { get; set; }

        //public virtual NivelEstudio NivelEstudio { get; set; }

        //public virtual bool IncluirWeb { get; set; }

        //public virtual string Entidad { get; set; }

        //public virtual Sector Sector { get; set; }

        //public virtual Organizacion Organizacion { get; set; }

        //public virtual Nivel Nivel2 { get; set; }

        //public virtual Nivel Nivel3 { get; set; }

        //public virtual Nivel Nivel4 { get; set; }

        //public virtual Nivel Nivel5 { get; set; }

        //public virtual Nivel Nivel6 { get; set; }

        //public virtual Departamento Departamento { get; set; }

        //public virtual string OtraEmpresaInstitucionParticipante { get; set; }

        //public virtual string BecarioParticipante { get; set; }

        //public virtual Area Area { get; set; }

        //public virtual Disciplina Disciplina { get; set; }

        //public virtual Subdisciplina Subdisciplina { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}
