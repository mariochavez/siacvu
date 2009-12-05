using System;
using SharpArch.Core.DomainModel;

namespace DecisionesInteligentes.Colef.Sia.Core
{
	public class Firma : Entity, IBaseEntity
    {
		public virtual int TipoProducto { get; set; }

		public virtual DateTime Firma1 { get; set; }

		public virtual int Aceptacion1 { get; set; }

		public virtual Usuario Usuario1 { get; set; }

		public virtual DateTime Firma2 { get; set; }

		public virtual int Aceptacion2 { get; set; }

		public virtual Usuario Usuario2 { get; set; }

		public virtual DateTime Firma3 { get; set; }

		public virtual int Aceptacion3 { get; set; }

		public virtual Usuario Usuario3 { get; set; }

		public virtual Usuario CreadoPor { get; set; }

		public virtual DateTime CreadoEl { get; set; }

		public virtual Usuario ModificadoPor { get; set; }

		public virtual DateTime ModificadoEl { get; set; }

		public virtual bool Activo { get; set; }
    }

    public class FirmaArticulo : Firma
    {

    }

    public class FirmaCapitulo : Firma
    {

    }

    public class FirmaCurso : Firma
    {

    }

    public class FirmaDictamen : Firma
    {

    }

    public class FirmaDistincion : Firma
    {

    }

    public class FirmaEvento : Firma
    {

    }

    public class FirmaLibro : Firma
    {

    }

    public class FirmaOrganoExterno : Firma
    {

    }

    public class FirmaOrganoInterno : Firma
    {

    }

    public class FirmaParticipacion : Firma
    {

    }

    public class FirmaParticipacionMedio : Firma
    {

    }

    public class FirmaReporte : Firma
    {

    }

    public class FirmaResena : Firma
    {

    }

    public class FirmaTesisDirigida : Firma
    {

    }

    public class FirmaObraTraducida : Firma
    {

    }
}