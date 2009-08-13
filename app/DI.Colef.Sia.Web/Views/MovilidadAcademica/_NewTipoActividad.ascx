<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Tipo Actividad</label>
	<%=Html.DropDownList("TipoActividadMovilidadAcademica.TipoActividad", Model.TiposActividades.CreateSelectList<TipoActividadForm>("Id", "Nombre"),
	"Seleccione ...")%>
	<%=Html.ValidationMessage("TipoActividadMovilidadAcademica.TipoActividad") %>
</p>