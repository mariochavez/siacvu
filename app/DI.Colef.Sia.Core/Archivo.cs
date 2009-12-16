using System;
using NHibernate.Validator.Constraints;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
    public class Archivo : Entity, IBaseEntity
    {
        [NotNullNotEmpty]
        public virtual string Nombre { get; set; }

        public virtual int TipoProducto { get; set; }

        [NotNull]
        public virtual byte[] Datos { get; set; }

        public virtual string Contenido { get; set; }

        public virtual int Tamano { get; set; }

        public virtual Usuario CreadoPor { get; set; }

        public virtual DateTime CreadoEl { get; set; }

        public virtual Usuario ModificadoPor { get; set; }

        public virtual DateTime ModificadoEl { get; set; }

        public virtual bool Activo { get; set; }
    }

    public class ArchivoCurso : Archivo
    {

    }

    public class ArchivoDictamen : Archivo
    {

    }

    public class ArchivoDistincion : Archivo
    {

    }

    public class ArchivoEvento : Archivo
    {

    }

    public class ArchivoOrganoExterno : Archivo
    {

    }

    public class ArchivoOrganoInterno : Archivo
    {

    }

    public class ArchivoParticipacion : Archivo
    {

    }

    public class ArchivoParticipacionMedio : Archivo
    {

    }

    public class ArchivoTesisDirigida : Archivo
    {

    }

    public class ArchivoObraTraducida : Archivo
    {

    }
}