using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;
using SharpArch.Core.NHibernateValidator;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [HasUniqueDomainSignature]
    public class Investigador : Entity, IBaseEntity
    {
        public Investigador()
        {
            EstadosInvestigador = new List<EstadoInvestigador>();
            GradosAcademicosInvestigador = new List<GradoAcademicoInvestigador>();
            CargosAcademicosInvestigador = new List<CargoInvestigador>();
            SNIsInvestigador = new List<SNIInvestigador>();
            CategoriasInvestigador = new List<CategoriaInvestigador>();
        }

        public virtual void AddEstado(EstadoInvestigador estadoInvestigador)
        {
            EstadosInvestigador.Add(estadoInvestigador);
        }

        public virtual void AddGrado(GradoAcademicoInvestigador gradoAcademicoInvestigador)
        {
            GradosAcademicosInvestigador.Add(gradoAcademicoInvestigador);
        }

        public virtual void AddCargo(CargoInvestigador cargoInvestigador)
        {
            CargosAcademicosInvestigador.Add(cargoInvestigador);
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

        [NotEmpty]
        [Valid]
        public virtual IList<EstadoInvestigador> EstadosInvestigador { get; private set; }

        [NotEmpty]
        [Valid]
        public virtual IList<GradoAcademicoInvestigador> GradosAcademicosInvestigador { get; private set; }

        [NotEmpty]
        [Valid]
        public virtual IList<CargoInvestigador> CargosAcademicosInvestigador { get; private set; }

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
    }
}