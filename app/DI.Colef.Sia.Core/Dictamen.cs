using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core.NHibernateValidator;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    [DictamenValidator]
    public class Dictamen : Entity, IBaseEntity, IEditorial
    {
        const int tipoProducto = 4; // 4 Representa Dictamen

        public virtual int TipoProducto { get { return tipoProducto; } }

        public Dictamen()
        {
            ArchivoDictamenes = new List<ArchivoDictamen>();
            EditorialDictamenes = new List<EditorialDictamen>();
        }

        public virtual void AddArchivo(Archivo archivo)
        {
            archivo.TipoProducto = tipoProducto;
            ArchivoDictamenes.Add((ArchivoDictamen) archivo);
        }

        public virtual void AddEditorial(EditorialProducto editorial)
        {
            editorial.TipoProducto = tipoProducto;
            EditorialDictamenes.Add((EditorialDictamen)editorial);
        }

        public virtual void DeleteEditorial(EditorialProducto editorial)
        {
            EditorialDictamenes.Remove((EditorialDictamen)editorial);
        }

        public virtual void DeleteArchivo(Archivo archivo)
        {
            ArchivoDictamenes.Remove((ArchivoDictamen) archivo);
        }

        [Valid]
        public virtual IList<ArchivoDictamen> ArchivoDictamenes { get; private set; }

        public virtual Firma Firma { get; set; }

        [Valid]
        public virtual IList<EditorialDictamen> EditorialDictamenes { get; private set; }

        [NotNull]
        public virtual Usuario Usuario { get; set; }

        public virtual Departamento Departamento { get; set; }

        public virtual Sede Sede { get; set; }

        [NotNullNotEmpty]
        public virtual string Nombre { get; set; }

        public virtual DateTime FechaDictamen { get; set; }

        public virtual RevistaPublicacion RevistaPublicacion { get; set; }

        public virtual FondoConacyt FondoConacyt { get; set; }

        public virtual int Puntuacion { get; set; }

        public virtual TipoDictamen TipoDictamen { get; set; }

        public virtual Usuario CreadoPor { get; set; }

		public virtual DateTime CreadoEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }
}
