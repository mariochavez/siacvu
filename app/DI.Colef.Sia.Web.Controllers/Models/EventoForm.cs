namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Models
{
    public class EventoForm
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Titulo { get; set; }
        public bool Invitacion { get; set; }
        public string Lugar { get; set; }
        public string FechaInicial { get; set; }
        public string FechaFinal { get; set; }
        public string PalabraClave1 { get; set; }
        public string PalabraClave2 { get; set; }
        public string PalabraClave3 { get; set; }
        public bool Activo { get; set; }
        public string Modificacion { get; set; }

        //Espacio para Agregar Mapeos
        public int Ambito { get; set; }
        public int AmbitoId { get; set; }

        public int TipoEvento { get; set; }
        public int TipoEventoId { get; set; }

        public int InstitucionId { get; set; }
        public string InstitucionNombre { get; set; }

        public int LineaTematicaId { get; set; }
        public string LineaTematicaNombre { get; set; }

        public int TipoFinanciamiento { get; set; }
        public int TipoFinanciamientoId { get; set; }

        public int Investigador { get; set; }
        public string PeriodoReferenciaPeriodo { get; set; }

        public TipoParticipacionEventoForm[] TipoParticipacionEventos { get; set; }
        public CoautorExternoEventoForm[] CoautorExternoEventos { get; set; }
        public CoautorInternoEventoForm[] CoautorInternoEventos { get; set; }

        /* New */
        public TipoParticipacionEventoForm TipoParticipacionEvento { get; set; }
        public CoautorExternoEventoForm CoautorExternoEvento { get; set; }
        public CoautorInternoEventoForm CoautorInternoEvento { get; set; }

        /* Catalogos */
        public AmbitoForm[] Ambitos { get; set; }
        public TipoEventoForm[] TiposEventos { get; set; }
        public TipoParticipacionForm[] TiposParticipaciones { get; set; }
        public InvestigadorExternoForm[] CoautoresExternos { get; set; }
        public InvestigadorForm[] CoautoresInternos { get; set; }
        public TipoFinanciamientoForm[] TiposFinanciamientos { get; set; }
    }
}
