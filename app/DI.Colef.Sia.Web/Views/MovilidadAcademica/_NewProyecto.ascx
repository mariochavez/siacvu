<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Proyecto</label>
    
    <%=Html.DropDownList("ProyectoMovilidadAcademica.ProyectoId", Model.Proyectos.CreateSelectList<ProyectoForm>("Id", "Nombre"),
                "Seleccione ...", new { rel = "#proyecto" })%>
	<%=Html.ValidationMessage("ProyectoMovilidadAcademica.ProyectoId") %>
</p>
