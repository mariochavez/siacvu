using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ShowFieldsForm
    {
        public string RevistaPublicacionTitulo { get; set; }
        public string RevistaPublicacionInstitucionNombre { get; set; }
        public string RevistaPublicacionPaisNombre { get; set; }
        public string RevistaPublicacionIndice1Nombre { get; set; }
        public string RevistaPublicacionIndice2Nombre { get; set; }
        public string RevistaPublicacionIndice3Nombre { get; set; }

        public string AreaTematicaNombre { get; set; }
        public string AreaTematicaLineaTematicaNombre { get; set; }

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

        public string ProyectoNombre { get; set; }

        public int Nivel2Id { get; set; }
        public int SubdisciplinaId { get; set; }
        public int ClaseId { get; set; }
        public int AreaTematicaId { get; set; }
        public int InstitucionId { get; set; }
        public int RevistaPublicacionId { get; set; }
        public int ProyectoId { get; set; }

        public int ModelId { get; set; }
        public bool IsShowForm { get; set; }
        public string InstitucionLabel { get; set; }
        public string RevistaLabel { get; set; }

        public string DireccionRegionalNombre { get; set; }

        public AreaForm[] Areas { get; set; }
        public DisciplinaForm[] Disciplinas { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
    }
}