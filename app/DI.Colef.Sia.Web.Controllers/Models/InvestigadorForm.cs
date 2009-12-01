using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class InvestigadorForm
    {
        public int Id { get; set; }
        public string FechaIngreso { get; set; }
        public string FechaContrato { get; set; }

        public string ExpedienteProduccion { get; set; }
        public string ExpedienteAcademico { get; set; }
        public string ClaveCVU { get; set; }

        public int AreaTematica { get; set; }
        public string AreaTematicaLineaTematicaNombre { get; set; }

        public string AreaTematica1 { get; set; }
        public string AreaTematica2 { get; set; }
        public string AreaTematica3 { get; set; }

		public bool Activo { get; set; }
		public string Modificacion { get; set; }

        public int Usuario { get; set; }

        public string UsuarioNombre { get; set; }
        public string UsuarioApellidoPaterno { get; set; }
        public string UsuarioApellidoMaterno { get; set; }
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

        public string NombreCoautor
        {
            get
            {
                return string.Format("{0} {1} {2}", UsuarioApellidoPaterno,
                                     UsuarioApellidoMaterno, UsuarioNombre);
            }
        }

        public EstadoInvestigadorForm[] EstadosInvestigador { get; set; }
        public GradoAcademicoInvestigadorForm[] GradosAcademicosInvestigador { get; set; }
        public CategoriaInvestigadorForm[] CategoriasInvestigador { get; set; }
        public CargoInvestigadorForm[] CargosInvestigador { get; set; }
        public SNIInvestigadorForm[] SNIsInvestigador { get; set; }

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
        public AreaTematicaForm[] AreasTematicas { get; set; }

        public PuestoForm[] Puestos { get; set; }

        public ArchivoForm[] ArchivosInvestigador { get; set; }
        public ArchivoForm ArchivoInvestigador { get; set; }
        public TipoArchivoForm[] TipoArchivos { get; set; }

        public string ExpedienteSNI { get; set; }
    }
}
