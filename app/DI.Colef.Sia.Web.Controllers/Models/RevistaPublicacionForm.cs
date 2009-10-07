namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class RevistaPublicacionForm
    {
        public int Id { get; set; }
        public string Titulo { get; set; }
        public string Periodicidad { get; set; }
        public string Issn { get; set; }
        public string Detalle { get; set; }
        public string Tipo { get; set; }
        public string Estado { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public int InstitucionId { get; set; }
        public string InstitucionNombre { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }

        public int Indice1 { get; set; }
        public int Indice1Id { get; set; }
        public string Indice1Nombre { get; set; }

        public int Indice2 { get; set; }
        public int Indice2Id { get; set; }
        public string Indice2Nombre { get; set; }

        public int Indice3 { get; set; }
        public int Indice3Id { get; set; }
        public string Indice3Nombre { get; set; }

        public PaisForm[] Paises { get; set; }
        public IndiceForm[] Indices1 { get; set; }
        public IndiceForm[] Indices2 { get; set; }
        public IndiceForm[] Indices3 { get; set; }
    }
}
