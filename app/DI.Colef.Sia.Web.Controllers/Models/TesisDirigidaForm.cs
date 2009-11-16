using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class TesisDirigidaForm
    {
        public int Id { get; set; }
        public string Titulo { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }
        public string NombreAlumno { get; set; }
        public string DepartamentoInvestigadorNombre { get; set; }
        public string SedeNombre { get; set; }

        public int TipoEstudiante { get; set; }

        public int VinculacionAPyD { get; set; }
        public int VinculacionAPyDId { get; set; }
        public string VinculacionAPyDNombre { get; set; }

        public int GradoAcademico { get; set; }
        public int GradoAcademicoId { get; set; }
        public string GradoAcademicoNombre { get; set; }

        public int FormaParticipacion { get; set; }
        public int FormaParticipacionId { get; set; }
        public string FormaParticipacionNombre { get; set; }

        public int InstitucionId { get; set; }
        public string InstitucionNombre { get; set; }
        public string InstitucionPaisNombre { get; set; }

        public int Nivel2Id { get; set; }
        public int SubdisciplinaId { get; set; }
        public int TesisPosgradoId { get; set; }

        public NivelForm Nivel2 { get; set; }
        public SubdisciplinaForm Subdisciplina { get; set; }
        public TesisPosgradoForm TesisPosgrado { get; set; }

        /* Catalogos */
        public GradoAcademicoForm[] GradosAcademicos { get; set; }
        public FormaParticipacionForm[] FormasParticipaciones { get; set; }
        public NivelForm[] Niveles2 { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
        public CustomSelectForm[] TiposEstudiantes { get; set; }
        public VinculacionAPyDForm[] VinculacionesAPyDs { get; set; }
        public TesisPosgradoForm[] TesisPosgrados { get; set; }

        public ShowFieldsForm ShowFields { get; set; }
    }
}
