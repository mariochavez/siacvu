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
        public int SubdisciplinaId { get; set; }
        public int ClaseId { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }
        public string PaisNombre { get; set; }

        /* Show */
        public ShowFieldsForm ShowFields { get; set; }
        public NivelForm Nivel2 { get; set; }
        public SubdisciplinaForm Subdisciplina { get; set; }
        public ClaseForm Clase { get; set; }

        /* Catalogos */
        public NivelForm[] Niveles2 { get; set; }
        public PaisForm[] Paises { get; set; }
        public SubdisciplinaForm[] Subdisciplinas { get; set; }
        public ClaseForm[] Clases { get; set; }
    }
}