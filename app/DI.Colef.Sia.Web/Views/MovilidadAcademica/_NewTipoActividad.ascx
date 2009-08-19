<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Tipo Actividad</label>
	<%=Html.DropDownList("TipoActividadMovilidadAcademica.TipoActividadId", Model.TiposActividades.CreateSelectList<TipoActividadForm>("Id", "Nombre"),
                "Seleccione ...", new { rel = "#tipoactividad" })%>
	<%=Html.ValidationMessage("TipoActividadMovilidadAcademica.TipoActividadId") %>
</p>