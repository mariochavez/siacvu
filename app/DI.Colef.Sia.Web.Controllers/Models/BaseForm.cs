using System;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class BaseForm
    {
        public int Id { get; set; }

        public int FirmaAceptacion2 { get; set; }
        public string FirmaDescripcion { get; set; }

		public int Puntuacion { get; set; }
        public int PosicionCoautor { get; set; }
        public string UsuarioNombre { get; set; }
        public string UsuarioApellidoPaterno { get; set; }
        public string UsuarioApellidoMaterno { get; set; }

        public string InvestigadorNombre
        {
            get { return string.Format("{0} {1} {2}", UsuarioApellidoPaterno, UsuarioApellidoMaterno, UsuarioNombre); }
        }

        public int LineaTematicaId { get; set; }
        public int AreaTematicaId { get; set; }

        public CatalogoForm[] LineasTematicas { get; set; }
        public CatalogoForm[] AreasTematicas { get; set; }

        public int RevistaPublicacionId { get; set; }
        public string RevistaPublicacionTitulo { get; set; }
        public string RevistaPublicacionInstitucionNombre { get; set; }
        public string RevistaPublicacionIndice1Nombre { get; set; }
        public string RevistaPublicacionIndice2Nombre { get; set; }
        public string RevistaPublicacionIndice3Nombre { get; set; }

        public bool RevistaPublicacionExists
        {
            get
            {
                return RevistaPublicacionId > 0;
            }
        }

        public virtual EditorialProductoForm[] Editoriales
        {
            get { throw new NotSupportedException(); }
        }

        public virtual InstitucionProductoForm[] Instituciones
        {
            get {throw new NotSupportedException();}
        }

        public virtual ArchivoForm[] Archivos
        {
            get { throw new NotSupportedException(); }
        }
    }
}