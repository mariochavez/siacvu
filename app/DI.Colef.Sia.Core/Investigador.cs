using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class Investigador : Entity, IBaseEntity
    {
        const int tipoProducto = 50; // 50 Representa investigador

        public Investigador()
        {
            EstadosInvestigador = new List<EstadoInvestigador>();
            GradosAcademicosInvestigador = new List<GradoAcademicoInvestigador>();
            CargosInvestigador = new List<CargoInvestigador>();
            SNIsInvestigador = new List<SNIInvestigador>();
            CategoriasInvestigador = new List<CategoriaInvestigador>();
            ArchivosInvestigador = new List<ArchivoInvestigador>();
        }

        public virtual void AddArchivo(Archivo archivo)
        {
            archivo.TipoProducto = tipoProducto;
            ArchivosInvestigador.Add((ArchivoInvestigador)archivo);
        }

        public virtual void AddEstado(EstadoInvestigador estadoInvestigador)
        {
            EstadosInvestigador.Add(estadoInvestigador);
        }

        public virtual void DeleteArchivo(Archivo archivo)
        {
            ArchivosInvestigador.Remove((ArchivoInvestigador)archivo);
        }

        public virtual void AddGrado(GradoAcademicoInvestigador gradoAcademicoInvestigador)
        {
            GradosAcademicosInvestigador.Add(gradoAcademicoInvestigador);
        }

        public virtual void AddCargo(CargoInvestigador cargoInvestigador)
        {
            CargosInvestigador.Add(cargoInvestigador);
        }

        public virtual void AddSNI(SNIInvestigador sniInvestigador)
        {
            SNIsInvestigador.Add(sniInvestigador);
        }

        public virtual void AddCategoria(CategoriaInvestigador categoriaInvestigador)
        {
            CategoriasInvestigador.Add(categoriaInvestigador);
        }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        [NotEmptyDate]
        public virtual DateTime FechaIngreso { get; set; }

        public virtual DateTime FechaContrato { get; set; }

        [Length(40)]
        public virtual string ExpedienteProduccion { get; set; }

        [Length(40)]
        public virtual string ExpedienteAcademico { get; set; }

        [Length(20)]
        public virtual string ClaveCVU { get; set; }

        [NotNull]
        public virtual LineaTematica LineaTematica { get; set; }

        public virtual string AreaTematica1 { get; set; }

        public virtual string AreaTematica2 { get; set; }

        public virtual string AreaTematica3 { get; set; }

        [NotEmpty]
        [Valid]
        public virtual IList<EstadoInvestigador> EstadosInvestigador { get; private set; }

        [NotEmpty]
        [Valid]
        public virtual IList<GradoAcademicoInvestigador> GradosAcademicosInvestigador { get; private set; }

        [NotEmpty]
        [Valid]
        public virtual IList<CargoInvestigador> CargosInvestigador { get; private set; }

        [NotEmpty]
        [Valid]
        public virtual IList<SNIInvestigador> SNIsInvestigador { get; private set; }

        [NotEmpty]
        [Valid]
        public virtual IList<CategoriaInvestigador> CategoriasInvestigador { get; private set; }

        public virtual Usuario CreadorPor { get; set; }

        public virtual DateTime CreadorEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }

        [Valid]
        public virtual IList<ArchivoInvestigador> ArchivosInvestigador { get; private set; }
    }
}