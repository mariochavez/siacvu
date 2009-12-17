namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class IdiomasInvestigadorForm
    {
        public int Id { get; set; }
        public string LenguaMaterna { get; set; }
        public bool Traductor { get; set; }
        public bool Profesor { get; set; }
        public string FechaEvaluacion { get; set; }
        public string NombreDocumentoProbatorio { get; set; }
        public int Puntuacion { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        //Espacio para Agregar Mapeos
        public int Idioma { get; set; }
        public int IdiomaId { get; set; }
        public string IdiomaNombre { get; set; }

        public int NivelConversacion { get; set; }
        public int NivelLectura { get; set; }
        public int NivelEscritura { get; set; }

        /* Catalogos */
        public IdiomaForm[] Idiomas { get; set; }
        public CustomSelectForm[] NivelesConversacion { get; set; }
        public CustomSelectForm[] NivelesLectura { get; set; }
        public CustomSelectForm[] NivelesEscritura { get; set; }
    }
}
