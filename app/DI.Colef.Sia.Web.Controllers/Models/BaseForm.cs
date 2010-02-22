namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class BaseForm
    {
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
    }
}