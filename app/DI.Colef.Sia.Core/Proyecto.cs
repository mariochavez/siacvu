using System;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using System.Collections.Generic;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [HasUniqueDomainSignature]
    [ProyectoValidator]
    public class Proyecto : Entity, IBaseEntity, IParticipante
    {
        const int tipoProducto = 15; //15 representa proyectos

        public virtual int TipoProducto { get { return tipoProducto; } }

        public Proyecto()
        {
            ResponsableProyectos = new List<ResponsableProyecto>();
            ParticipanteInternoProyectos = new List<ParticipanteInternoProyecto>();
            ParticipanteExternoProyectos = new List<ParticipanteExternoProyecto>();
            RecursoFinancieroProyectos = new List<RecursoFinancieroProyecto>();
            EstudianteProyectos = new List<EstudianteProyecto>();
            ProductoGeneradoProyectos = new List<ProductoGeneradoProyecto>();
            ArchivosProyecto = new List<ArchivoProyecto>();
        }

        public virtual IList<ArchivoProyecto> ArchivosProyecto { get; private set; }

        public virtual void AddArchivo(Archivo archivo)
        {
            archivo.TipoProducto = tipoProducto;
            ArchivosProyecto.Add((ArchivoProyecto) archivo);
        }

        public virtual void DeleteArchivo(Archivo archivo)
        {
            ArchivosProyecto.Remove((ArchivoProyecto) archivo);
        }

        public virtual void AddResponsable(ResponsableProyecto responsableProyecto)
        {
            ResponsableProyectos.Add(responsableProyecto);
        }

        public virtual void DeleteResponsable(ResponsableProyecto responsableProyecto)
        {
            ResponsableProyectos.Remove(responsableProyecto);
        }

        public virtual void AddRecursoFinanciero(RecursoFinancieroProyecto recursoFinancieroProyecto)
        {
            RecursoFinancieroProyectos.Add(recursoFinancieroProyecto);
        }

        public virtual void DeleteRecursoFinanciero(RecursoFinancieroProyecto recursoFinancieroProyecto)
        {
            RecursoFinancieroProyectos.Remove(recursoFinancieroProyecto);
        }

        public virtual void AddEstudiante(EstudianteProyecto estudianteProyecto)
        {
            EstudianteProyectos.Add(estudianteProyecto);
        }

        public virtual void DeleteEstudiante(EstudianteProyecto estudianteProyecto)
        {
            EstudianteProyectos.Remove(estudianteProyecto);
        }

        public virtual void AddProducto(ProductoGeneradoProyecto productoGenerado)
        {
            ProductoGeneradoProyectos.Add(productoGenerado);
        }

        public virtual void DeleteProducto(ProductoGeneradoProyecto productoGenerado)
        {
            ProductoGeneradoProyectos.Remove(productoGenerado);
        }

        public virtual void AddParticipanteInterno(ParticipanteInternoProducto participanteInterno)
        {
            participanteInterno.TipoProducto = tipoProducto;
            ParticipanteInternoProyectos.Add((ParticipanteInternoProyecto) participanteInterno);
        }

        public virtual void DeleteParticipanteInterno(ParticipanteInternoProducto participanteInterno)
        {
            ParticipanteInternoProyectos.Remove((ParticipanteInternoProyecto) participanteInterno);
        }

        public virtual void AddParticipanteExterno(ParticipanteExternoProducto participanteExterno)
        {
            participanteExterno.TipoProducto = tipoProducto;
            ParticipanteExternoProyectos.Add((ParticipanteExternoProyecto) participanteExterno);
        }

        public virtual void DeleteParticipanteExterno(ParticipanteExternoProducto participanteExterno)
        {
            ParticipanteExternoProyectos.Remove((ParticipanteExternoProyecto)participanteExterno);
        }

        //Seccion Informacion General
        [NotNullNotEmpty]
        [DomainSignature]
        public virtual string Nombre { get; set; }

        public virtual TipoProyecto TipoProyecto { get; set; }

        //Seccion Investigadores participantes
        [Valid]
        public virtual IList<ResponsableProyecto> ResponsableProyectos { get; private set; }

        public virtual bool ParticipanteSeOrdenaAlfabeticamente { get; set; }

        [Valid]
        public virtual IList<ParticipanteInternoProyecto> ParticipanteInternoProyectos { get; private set; }

        [Valid]
        public virtual IList<ParticipanteExternoProyecto> ParticipanteExternoProyectos { get; private set; }

        public virtual int PosicionParticipante { get; set; }

        [Valid]
        public virtual Firma Firma { get; set; }

        //Seccion Calendario del proyecto
        public virtual DateTime FechaInicial { get; set; }

        public virtual DateTime FechaFinal { get; set; }

        public virtual DateTime FechaProrroga { get; set; }

        public virtual int EstadoProyecto { get; set; } //Catalogo Fijo

        public virtual DateTime FechaConclusion { get; set; }

        //Seccion fuentes del financiamiento del proyecto
        public virtual bool ConRecursos { get; set; }

        public virtual bool ConConvenio { get; set; }

        public virtual Convenio Convenio { get; set; } //Nota es una vista

        public virtual Sector SectorFinanciamiento { get; set; }

        public virtual FondoConacyt FondoConacyt { get; set; }

        //Seccion Recursos Financieros
        [Valid]
        public virtual IList<RecursoFinancieroProyecto> RecursoFinancieroProyectos { get; private set; }

        //Seccion Tematica del proyecto
        public virtual string ObjetivoGeneral { get; set; }

        public virtual AreaTematica AreaTematica { get; set; }

        public virtual int ImpactoPoliticaPublica { get; set; } // Catalogo Fijo

        public virtual VinculacionAPyD VinculacionAPyD { get; set; } //Catalogo fijo y hacer modicacion en tesis

        public virtual string ResumenProyecto { get; set; }

        //Area Conocimiento
        public virtual Area Area { get; set; }

        public virtual Disciplina Disciplina { get; set; }

        public virtual Subdisciplina Subdisciplina { get; set; }

        [Valid]
        public virtual Archivo ComprobanteTematicaProyecto { get; set; }

        //Seccion Productos academicos contemplados
        public virtual string Actividades { get; set; }

        public virtual string ProductoAcademicoEsperado { get; set; }
        
        //Seccion participacion de estudiantes/becarios
        public virtual bool ParticipaEstudiante { get; set; }

        [Valid]
        public virtual IList<EstudianteProyecto> EstudianteProyectos { get; private set; }

        //Estructura Funcional
        public virtual Sector Sector { get; set; }

        public virtual Organizacion Organizacion { get; set; }

        public virtual Nivel Nivel2 { get; set; }

        //Actividad Economica
        public virtual Sector SectorEconomico { get; set; }

        public virtual Rama Rama { get; set; }

        public virtual Clase Clase { get; set; }

        //Seccion Productos generados del proyecto
        [Valid]
        public virtual IList<ProductoGeneradoProyecto> ProductoGeneradoProyectos { get; private set; }

        public virtual Departamento Departamento { get; set; }

        public virtual Sede Sede { get; set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual Usuario CreadoPor { get; set; }

        public virtual DateTime CreadoEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }

        public virtual decimal Puntuacion { get; set; }
    }
}
