using System.Linq;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class InvestigadorForm : BaseForm
    {
        public string FechaIngreso { get; set; }
        public string FechaContrato { get; set; }

        public string ExpedienteProduccion { get; set; }
        public string ExpedienteAcademico { get; set; }
        public string ClaveCVU { get; set; }

		public bool Activo { get; set; }
		public string Modificacion { get; set; }

        public int Usuario { get; set; }
        public int UsuarioId { get; set; }
        public string UsuarioDireccion { get; set; }
        public string UsuarioTelefono { get; set; }
        public string UsuarioCorreoElectronico { get; set; }
        public string UsuarioEstadoCivil { get; set; }
        public string UsuarioFechaNacimiento { get; set; }
        public string UsuarioDocumentosIdentidad { get; set; }
        public string UsuarioCURP { get; set; }
        public string UsuarioRFC { get; set; }
        public string UsuarioSexo { get; set; }
        public string UsuarioNacionalidad { get; set; }
        public string UsuarioFechaIngreso { get; set; }
        public string UsuarioCedulaProfesional { get; set; }
        public string UsuarioCodigoRH { get; set; }

        public string Nombre { 
            get
            {
                return string.Format("{0} {1} {2}", UsuarioApellidoPaterno,
                                     UsuarioApellidoMaterno, UsuarioNombre);
            }
        }

        public string NombreCompleto
        {
            get
            {
                return string.Format("{0} {1} {2}", UsuarioNombre, UsuarioApellidoPaterno, UsuarioApellidoMaterno);
            }
        }

        public string NombreCoautor
        {
            get
            {
                return string.Format("{0} {1} {2}", UsuarioApellidoPaterno,
                                     UsuarioApellidoMaterno, UsuarioNombre);
            }
        }

        public GradoAcademicoInvestigadorForm GradoAcademico
        {
            get
            {
                if (GradosAcademicosInvestigador.Length > 0)
                    return GradosAcademicosInvestigador[0];
                
                return new GradoAcademicoInvestigadorForm
                           {
                               GradoAcademicoNombre = string.Empty,
                               Programa = string.Empty,
                               InstitucionNombre = string.Empty,
                               InstitucionPaisNombre = string.Empty,
                           };
            }
        }

        EstadoInvestigadorForm[] estadosInvestigador;
        public EstadoInvestigadorForm[] EstadosInvestigador
        {
            get
            {
                if (estadosInvestigador == null)
                    return null;

                var result = from estado in estadosInvestigador
                             orderby estado.FechaInicial.FromShortDateToDateTime() descending
                             select estado;

                return result.ToArray();
            }
            set { estadosInvestigador = value; }
        }

        GradoAcademicoInvestigadorForm[] gradosAcademicosInvestigador;
        public GradoAcademicoInvestigadorForm[] GradosAcademicosInvestigador
        {
            get
            {
                if (gradosAcademicosInvestigador == null)
                    return null;

                var result = from gradoAcademico in gradosAcademicosInvestigador
                             orderby gradoAcademico.Fecha.FromShortDateToDateTime() descending
                             select gradoAcademico;

                return result.ToArray();
            }
            set { gradosAcademicosInvestigador = value; }
        }

        public CategoriaInvestigadorForm Categoria
        {
            get
            {
                if (CategoriasInvestigador.Length > 0)
                    return categoriasInvestigador[0];

                return new CategoriaInvestigadorForm
                           {
                               CategoriaNombre = string.Empty
                           };
            }
        }

        CategoriaInvestigadorForm[] categoriasInvestigador;
        public CategoriaInvestigadorForm[] CategoriasInvestigador
        {
            get
            {
                if (categoriasInvestigador == null)
                    return null;

                var result = from categoria in categoriasInvestigador
                             orderby categoria.FechaInicial.FromShortDateToDateTime() descending
                             select categoria;

                return result.ToArray();
            }
            set { categoriasInvestigador = value; }
        }

        CargoInvestigadorForm[] cargosInvestigador;
        public CargoInvestigadorForm[] CargosInvestigador
        {
            get
            {
                if (cargosInvestigador == null)
                    return null;

                var result = from cargo in cargosInvestigador
                             orderby cargo.Modificacion.FromShortDateToDateTime() descending
                             select cargo;

                return result.ToArray();
            }
            set { cargosInvestigador = value; }
        }

        public SNIInvestigadorForm SNI
        {
            get
            {
                if (SNIsInvestigador.Length > 0)
                    return SNIsInvestigador[0];

                return new SNIInvestigadorForm
                           {
                               SNINombre = string.Empty
                           };
            }
        }

        SNIInvestigadorForm[] snisInvestigador;
        public SNIInvestigadorForm[] SNIsInvestigador
        {
            get
            {
                if (snisInvestigador == null)
                    return null;

                var result = from sni in snisInvestigador
                             orderby sni.FechaInicial.FromShortDateToDateTime() descending
                             select sni;

                return result.ToArray();
            }
            set { snisInvestigador = value; }
        }

        /* New */
        public EstadoInvestigadorForm EstadoInvestigador { get; set; }
        public GradoAcademicoInvestigadorForm GradoAcademicoInvestigador { get; set; }
        public CategoriaInvestigadorForm CategoriaInvestigador { get; set; }
        public CargoInvestigadorForm CargoInvestigador { get; set; }
        public SNIInvestigadorForm SNIInvestigador { get; set; }
        
        /* Catalogos */
        public UsuarioForm[] Usuarios { get; set; }
        public EstadoForm[] Estados { get; set; }
        public GradoAcademicoForm[] GradosAcademicos { get; set; }
        public CategoriaForm[] Categorias { get; set; }
        public DepartamentoForm[] Departamentos { get; set; }
        public SedeForm[] Sedes { get; set; }
        public SNIForm[] SNIs { get; set; }

        public string AreaTematicaNombre { get; set; }
        public string AreaTematicaLineaTematicaNombre { get; set; }

        public string AreaTematica1 { get; set; }
        public string AreaTematica2 { get; set; }
        public string AreaTematica3 { get; set; }

        public PuestoForm[] Puestos { get; set; }

        public ArchivoForm[] ArchivosInvestigador { get; set; }
        public ArchivoForm ArchivoInvestigador { get; set; }
        public TipoArchivoForm[] TipoArchivos { get; set; }

        public string ExpedienteSNI { get; set; }

        public AreaTematicaForm AreaTematica { get; set; }

        public object[] ListaProductos { get; set; }
    }
}
