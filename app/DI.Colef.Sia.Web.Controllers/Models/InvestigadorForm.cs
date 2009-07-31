namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class InvestigadorForm
    {
		public int Id { get; set; }
        public string FechaIngreso { get; set; }

		public bool Activo { get; set; }
		public string Modificacion { get; set; }

        public int Usuario { get; set; }

        public EstadoInvestigadorForm EstadoInvestigador { get; set; }
        public GradoAcademicoInvestigadorForm GradoAcademicoInvestigador { get; set; }
        public CategoriaInvestigadorForm CategoriaInvestigador { get; set; }
        public CargoInvestigadorForm CargoInvestigador { get; set; }
        public SNIInvestigadorForm SNIInvestigador { get; set; }
        
        public UsuarioForm[] Usuarios { get; set; }
        public EstadoForm[] Estados { get; set; }
        public GradoAcademicoForm[] GradosAcademicos { get; set; }
        public CategoriaForm[] Categorias { get; set; }
        public CargoForm[] Cargos { get; set; }
        public DepartamentoForm[] Departamentos { get; set; }
        public SedeForm[] Sedes { get; set; }
        public SNIForm[] SNIs { get; set; }
    }
}
