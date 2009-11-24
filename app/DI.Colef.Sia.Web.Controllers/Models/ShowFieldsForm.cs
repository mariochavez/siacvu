using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ShowFieldsForm
    {
        public string RevistaPublicacionInstitucionNombre { get; set; }
        public string RevistaPublicacionPaisNombre { get; set; }

        public string ProyectoAreaTematicaLineaTematicaNombre { get; set; }
        public string ProyectoAreaTematicaNombre { get; set; }
        public string ProyectoAreaTematicaSubdisciplinaDisciplinaAreaNombre { get; set; }
        public string ProyectoAreaTematicaSubdisciplinaDisciplinaNombre { get; set; }
        public string ProyectoAreaTematicaSubdisciplinaNombre { get; set; }

        public string AreaTematicaNombre { get; set; }
        public string AreaTematicaLineaTematicaNombre { get; set; }
        public string AreaTematicaSubdisciplinaNombre { get; set; }
        public string AreaTematicaSubdisciplinaDisciplinaNombre { get; set; }
        public string AreaTematicaSubdisciplinaDisciplinaAreaNombre { get; set; }

        public string SubdisciplinaNombre { get; set; }
        public string SubdisciplinaDisciplinaNombre { get; set; }
        public string SubdisciplinaDisciplinaAreaNombre { get; set; }

        public string ClaseNombre { get; set; }
        public string ClaseRamaNombre { get; set; }
        public string ClaseRamaSectorEconomicoNombre { get; set; }

        public string Nivel2Nombre { get; set; }
        public string Nivel2OrganizacionNombre { get; set; }
        public string Nivel2OrganizacionSectorNombre { get; set; }

        public string InstitucionNombre { get; set; }
        public bool InstitucionTipoInstitucionNombre { get; set; }
        public string InstitucionPaisNombre { get; set; }
        public string InstitucionEstadoPaisNombre { get; set; }
        public string InstitucionCiudad { get; set; }

        public int Nivel2Id { get; set; }
        public int SubdisciplinaId { get; set; }
        public int ClaseId { get; set; }
        public int AreaTematicaId { get; set; }
        public int InstitucionId { get; set; }

        public int ModelId { get; set; }
        public bool IsShowForm { get; set; }
    }
}