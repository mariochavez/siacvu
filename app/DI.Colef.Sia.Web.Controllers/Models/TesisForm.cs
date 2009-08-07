using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class TesisForm
    {
        public int Id { get; set; }
        public string Titulo { get; set; }
        public string FechaConclusion { get; set; }
        public string Autor { get; set; }
        public string FechaGrado { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }


        public int GradoAcademico { get; set; }
        public int Pais { get; set; }
        public int FormaParticipacion { get; set; }
        public int Institucion { get; set; }
        public int ProgramaEstudio { get; set; }
        public int LineaTematica { get; set; }
        public int PeriodoReferencia { get; set; }
        public int Sector { get; set; }
        public int Dependencia { get; set; }
        public int Departamento { get; set; }
        public int Area { get; set; }
        public int Disciplina { get; set; }
        public int Subdisciplina { get; set; }

        //Espacio para Agregar Mapeos



        /* New */

        /* Catalogos */
        public GradoAcademicoForm[] GradosAcademicos { get; set; }
        public PaisForm[] Paises { get; set; }
        public FormaParticipacionForm[] FormasParticipaciones { get; set; }
        public InstitucionForm[] Instituciones { get; set; }
        public ProgramaEstudioForm[] ProgramasEstudios { get; set; }
        public LineaTematicaForm[] LineasTematicas { get; set; }
        public PeriodoReferenciaForm[] PeriodosReferencias { get; set; }
        public SectorForm[] Sectores { get; set; }
        public DependenciaForm[] Dependencias { get; set; }
        public DepartamentoForm[] Departamentos { get; set; }
        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }


    }
}
