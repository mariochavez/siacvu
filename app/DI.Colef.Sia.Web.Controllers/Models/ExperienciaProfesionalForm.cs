using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class ExperienciaProfesionalForm
    {
        public int Id { get; set; }
        public string Entidad { get; set; }
        public string Nombramiento { get; set; }
        public string FechaInicial { get; set; }
        public string FechaFinal { get; set; }
        public string LineaInvestigacion1 { get; set; }
        public string LineaInvestigacion2 { get; set; }
        public string LineaInvestigacion3 { get; set; }
        public string PrincipalesLogros { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        //Espacio para Agregar Mapeos
        public int Nivel2Id { get; set; }
        public string Nivel2Nombre { get; set; }

        public int SubdisciplinaId { get; set; }
        public string SubdisciplinaNombre { get; set; }

        public int ClaseId { get; set; }
        public string ClaseNombre { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }
        public string PaisNombre { get; set; }

        /* Show */
        public ShowFieldsForm ShowFields { get; set; }
        public NivelForm Nivel2 { get; set; }
        public SubdisciplinaForm Subdisciplina { get; set; }
        public ClaseForm Clase { get; set; }

        /* Catalogos */
        public PaisForm[] Paises { get; set; }
    }
}