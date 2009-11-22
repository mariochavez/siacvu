<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<RamaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre</label>
    <%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input250-requerido", maxlength = 40 })%>
    <span>(Debe de ser un nombre &uacute;nico)</span>
    <%=Html.ValidationMessage("Nombre") %>
</p>
<p>
	<label>Sector</label>
	<%=Html.DropDownList("Sector", Model.Sectores.CreateSelectList<SectorForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("Sector") %>
</p>