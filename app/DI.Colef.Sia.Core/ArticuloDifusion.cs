using System;
using System.Collections.Generic;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class ArticuloDifusion: Entity, IBaseEntity, ICoautor
    {
        const int tipoProducto = 16; // 16 Representa Articulo Difusion

        public virtual int TipoProducto { get { return tipoProducto; } }

        public ArticuloDifusion()
        {
            CoautorExternoArticulos = new List<CoautorExternoArticulo>();
            CoautorInternoArticulos = new List<CoautorInternoArticulo>();
        }

        public virtual void AddCoautorExterno(CoautorExternoProducto coautorExterno)
        {
            coautorExterno.TipoProducto = tipoProducto;
            CoautorExternoArticulos.Add((CoautorExternoArticulo)coautorExterno);
        }

        public virtual void AddCoautorInterno(CoautorInternoProducto coautorInterno)
        {
            coautorInterno.TipoProducto = tipoProducto;
            CoautorInternoArticulos.Add((CoautorInternoArticulo)coautorInterno);
        }

        public virtual void DeleteCoautorInterno(CoautorInternoProducto coautorInterno)
        {
            CoautorInternoArticulos.Remove((CoautorInternoArticulo)coautorInterno);
        }

        public virtual void DeleteCoautorExterno(CoautorExternoProducto coautorExterno)
        {
            CoautorExternoArticulos.Remove((CoautorExternoArticulo)coautorExterno);
        }

        [NotNullNotEmpty]
        public virtual string Titulo { get; set; }

        public virtual int TipoArticulo { get; set; }

        public virtual bool TieneProyecto { get; set; }

        public virtual Proyecto Proyecto { get; set; }

        public virtual AreaTematica AreaTematica { get; set; }

        public virtual string PalabraClave1 { get; set; }

        public virtual string PalabraClave2 { get; set; }

        public virtual string PalabraClave3 { get; set; }

        public virtual Area Area { get; set; }

        public virtual Disciplina Disciplina { get; set; }

        public virtual Subdisciplina Subdisciplina { get; set; }

        public virtual bool CoautorSeOrdenaAlfabeticamente { get; set; }

        [Valid]
        public virtual IList<CoautorExternoArticulo> CoautorExternoArticulos { get; private set; }

        [Valid]
        public virtual IList<CoautorInternoArticulo> CoautorInternoArticulos { get; private set; }

        [Valid]
        public virtual Archivo ComprobanteAceptado { get; set; }

        [Valid]
        public virtual Archivo ComprobanteArticulo { get; set; }

        [Valid]
        public virtual Firma Firma { get; set; }

        public virtual int PosicionCoautor { get; set; }

        public virtual int EstadoProducto { get; set; }

        public virtual DateTime FechaAceptacion { get; set; }

        public virtual DateTime FechaPublicacion { get; set; }
        
        public virtual RevistaPublicacion RevistaPublicacion { get; set; }

        public virtual string RevistaPublicacionTitulo { get; set; }

        public virtual string Volumen { get; set; }

        public virtual string Numero { get; set; }

        public virtual int PaginaInicial { get; set; }

        public virtual int PaginaFinal { get; set; }

        public virtual decimal Puntuacion { get; set; }

        public virtual Departamento Departamento { get; set; }

        public virtual Sede Sede { get; set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual Usuario CreadoPor { get; set; }

        public virtual DateTime CreadoEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }
}