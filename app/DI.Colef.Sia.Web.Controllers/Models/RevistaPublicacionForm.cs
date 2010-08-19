namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class RevistaPublicacionForm
    {
        public int Id { get; set; }
        public string Titulo { get; set; }
        public int Periodicidad { get; set; }
        public string Issn { get; set; }
        public string Issne { get; set; }
        public string DepartamentoAcademico { get; set; }
        public string Contacto { get; set; }
        public string Email { get; set; }
        public string PaginaWeb { get; set; }
        public string Telefono { get; set; }
        public int TipoRevista { get; set; }
        public int ClasificacionSieva { get; set; }
        public string DescripcionRevista { get; set; }
        public string FactorImpacto { get; set; }
        public int FormatoRevista { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        public int InstitucionId { get; set; }
        public string InstitucionNombre { get; set; }

        public int Indice1 { get; set; }
        public int Indice1Id { get; set; }
        public string Indice1Nombre { get; set; }

        public int Indice2 { get; set; }
        public int Indice2Id { get; set; }
        public string Indice2Nombre { get; set; }

        public int Indice3 { get; set; }
        public int Indice3Id { get; set; }
        public string Indice3Nombre { get; set; }

        public int AreaInvestigacion { get; set; }
        public int AreaInvestigacionId { get; set; }
        public string AreaInvestigacionNombre { get; set; }

        public int Pais { get; set; }
        public int PaisId { get; set; }
        public string PaisNombre { get; set; }

        /* Catalogos */
        public CustomSelectForm[] Periodicidades { get; set; }
        public CustomSelectForm[] TipoRevistas { get; set; }
        public CustomSelectForm[] ClasificacionesSieva { get; set; }
        public CustomSelectForm[] FormatoRevistas { get; set; }
        public IndiceForm[] Indices1 { get; set; }
        public IndiceForm[] Indices2 { get; set; }
        public IndiceForm[] Indices3 { get; set; }
        public AreaInvestigacionForm[] AreasInvestigacion { get; set; }
        public PaisForm[] Paises { get; set; }
    }
}
