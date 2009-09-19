using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using System.Collections.Generic;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [HasUniqueDomainSignature]
    public class Proyecto : Entity, IBaseEntity
    {
        public Proyecto()
        {
            ResponsableInternoProyectos = new List<ResponsableInternoProyecto>();
            ParticipanteInternoProyectos = new List<ParticipanteInternoProyecto>();
            ParticipanteExternoProyectos = new List<ParticipanteExternoProyecto>();
            RecursoFinancieroProyectos = new List<RecursoFinancieroProyecto>();
        }

        public virtual void AddResponsableInterno(ResponsableInternoProyecto responsableInternoProyecto)
        {
            ResponsableInternoProyectos.Add(responsableInternoProyecto);
        }

        public virtual void AddParticipanteInterno(ParticipanteInternoProyecto participanteInternoProyecto)
        {
            ParticipanteInternoProyectos.Add(participanteInternoProyecto);
        }

        public virtual void AddParticipanteExterno(ParticipanteExternoProyecto participanteExternoProyecto)
        {
            ParticipanteExternoProyectos.Add(participanteExternoProyecto);
        }

        public virtual void AddRecursoFinanciero(RecursoFinancieroProyecto recursoFinancieroProyecto)
        {
            RecursoFinancieroProyectos.Add(recursoFinancieroProyecto);
        }

        ///A PARTIR DE AQUI EMPIEZA LA FORMA DE PROYECTOS COMO ESTA EN EL ZIP
        //Seccion Informacion General
        public virtual TipoProyecto TipoProyecto { get; set; }

        [NotNullNotEmpty]
        [DomainSignature]
        public virtual string Nombre { get; set; }

        public virtual IList<ResponsableInternoProyecto> ResponsableInternoProyectos { get; private set; }

        public virtual IList<ParticipanteInternoProyecto> ParticipanteInternoProyectos { get; private set; }

        public virtual IList<ParticipanteExternoProyecto> ParticipanteExternoProyectos { get; private set; }

        public virtual bool ConConvenio { get; set; }

        public virtual Convenio Convenio { get; set; }

        public virtual DateTime FechaInicial { get; set; }

        public virtual DateTime FechaFinal { get; set; }

        public virtual DateTime FechaProrroga { get; set; }

        public virtual EstatusProyecto EstatusProyecto { get; set; }

        public virtual DateTime FechaConclusion { get; set; }

        public virtual bool ConRecursos { get; set; }

        //Seccion Financiamiento del Proyecto
        public virtual SectorFinanciamiento SectorFinanciamiento { get; set; }

        public virtual FondoConacyt FondoConacyt { get; set; }

        public virtual IList<RecursoFinancieroProyecto> RecursoFinancieroProyectos { get; private set; }

        //Seccion Tematica del Proyecto
        public virtual string ObjetivoGeneral { get; set; }

        public virtual string PalabraClave1 { get; set; }

        public virtual string PalabraClave2 { get; set; }

        public virtual string PalabraClave3 { get; set; }

        public virtual LineaTematica LineaTematica { get; set; }

        public virtual AreaTematica AreaTematica { get; set; }

        public virtual ImpactoPoliticaPublica ImpactoPoliticaPublica { get; set; }

        public virtual string ImpactoAcademicoEsperado { get; set; }

        public virtual string UsuariosPotenciales { get; set; }

        public virtual string PosiblesBeneficiarios { get; set; }

        public virtual bool RequiereServicioUSEG { get; set; }

        public virtual USEG USEG { get; set; }

        //Seccion Productos Academicos contemplados
        public virtual ProductoAcademico ProductoAcademico { get; set; }

        public virtual ActividadPrevista ActividadPrevista { get; set; }

        public virtual DateTime FechaEntregaProducto { get; set; }

        //Seccion Participacion de Estudiantes

        public virtual bool ParticipaEstudiante { get; set; }

        public virtual string NombreEstudiante { get; set; }

        public virtual TipoEstudiante TipoEstudiante { get; set; }

        public virtual GradoAcademico GradoAcademico { get; set; }

        //Seccion Opcionales CVU
        //Estructura Funcional
        public virtual Sector Sector { get; set; }

        public virtual Organizacion Organizacion { get; set; }

        public virtual Nivel Nivel2 { get; set; }

        public virtual Nivel Nivel3 { get; set; }

        public virtual Nivel Nivel4 { get; set; }

        public virtual Nivel Nivel5 { get; set; }

        public virtual Nivel Nivel6 { get; set; }

        //Area Conocimiento
        public virtual Area Area { get; set; }

        public virtual Disciplina Disciplina { get; set; }

        public virtual Subdisciplina Subdisciplina { get; set; }

        //Actividad Economica
        public virtual Sector SectorEconomico { get; set; }

        public virtual Rama Rama { get; set; }

        public virtual Clase Clase { get; set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }


        ///Campos Prototipo

        //public virtual string Responsable { get; set; }

        //public virtual DateTime FechaRegistro { get; set; }

        //public virtual string ProductoEsperado { get; set; }

        //public virtual Coordinacion Coordinacion { get; set; }

        //public virtual DateTime FechaTramite { get; set; }

        ///Campos Nunca Usados
        //public virtual Sede Sede { get; set; }

        //public virtual string OtroImpacto { get; set; }

        //public virtual Ambito Ambito { get; set; }

        //public virtual TipoFinanciamiento TipoFinanciamiento { get; set; }

        //public virtual int Monto { get; set; }

        //public virtual Moneda Moneda { get; set; }

        //public virtual DateTime FechaEntregaCompromiso { get; set; }

        //public virtual Institucion Institucion { get; set; }

        //public virtual NivelEstudio NivelEstudio { get; set; }

        //public virtual bool IncluirWeb { get; set; }

        //public virtual string Entidad { get; set; }

        //public virtual Departamento Departamento { get; set; }

        //public virtual string OtraEmpresaInstitucionParticipante { get; set; }

        //public virtual string BecarioParticipante { get; set; }
    }
}
