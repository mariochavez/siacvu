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
        public int NivelConversacionId { get; set; }
        public string NivelConversacionNombre { get; set; }

        public int NivelLectura { get; set; }
        public int NivelLecturaId { get; set; }
        public string NivelLecturaNombre { get; set; }

        public int NivelEscritura { get; set; }
        public int NivelEscrituraId { get; set; }
        public string NivelEscrituraNombre { get; set; }

        /* Catalogos */
        public IdiomaForm[] Idiomas { get; set; }
        public NivelIdiomaForm[] NivelesConversacion { get; set; }
        public NivelIdiomaForm[] NivelesLectura { get; set; }
        public NivelIdiomaForm[] NivelesEscritura { get; set; }
    }
}
