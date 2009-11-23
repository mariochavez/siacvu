<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Clase</label>
    <%=Html.DropDownList("Clase", Model.Clases.CreateSelectList<ClaseForm>("Id", "Nombre"),
	            "Seleccione ...")%>
	<span class="cvu"></span>
    <%=Html.ValidationMessage("Clase") %>
</p>