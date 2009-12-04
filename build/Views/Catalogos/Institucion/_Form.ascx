<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InstitucionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<p>
    <label>Nombre de la instituci&oacute;n</label>
    <%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input420-bold-requerido", maxlength = 100 })%>
    <span>(Debe de ser un nombre &uacute;nico)</span>
    <%=Html.ValidationMessage("Nombre") %>
</p>
<p>
    <label>Agrupar instituci&oacute;n</label>
    <%=Html.TextBox("AgrupaInstitucion", Model.AgrupaInstitucion, new { @class = "input420-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("AgrupaInstitucion")%>
</p>
<p>
    <label>Siglas de la instituci&oacute;n</label>
    <%=Html.TextBox("Siglas", Model.Siglas, new { @class = "input420-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Siglas")%>
</p>
<p>
    <label>Sede</label>
    <%=Html.TextBox("Sede", Model.Sede, new { @class = "input420-requerido", maxlength = 100 })%>    
    <%=Html.ValidationMessage("Sede")%>
</p>
<p>
    <label>P&aacute;gina web</label>
    <%=Html.TextBox("PaginaWeb", Model.PaginaWeb, new { @class = "input420-requerido", maxlength = 100 })%>    
    <%=Html.ValidationMessage("PaginaWeb")%>
</p>
<p>
    <label>E-mail</label>
    <%=Html.TextBox("Email", Model.Email, new { @class = "input420-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Email")%>
</p>
<p>
    <label>Tel&eacute;fono y/o fax</label>
    <%=Html.TextBox("Telefono", Model.Telefono, new { @class = "input420-requerido", maxlength = 100 })%>    
    <%=Html.ValidationMessage("Telefono")%>
</p>
<p>
	<label>Pa&iacute;s</label>
    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido cascade", rel = Url.Action("ChangePais") })%>
    <%=Html.ValidationMessage("Pais") %>
</p>
<p>
    <label>Estado</label>
    <%=Html.DropDownList("EstadoPais", Model.EstadosPaises.CreateSelectList<EstadoPaisForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("EstadoPais") %>
</p>
<p>
    <label>Ciudad</label>
    <%=Html.TextBox("Ciudad", Model.Ciudad, new { @class = "input420-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Ciudad")%>
</p>
<p>
    <label>&Aacute;mbito de la instituci&oacute;n</label>
    <%=Html.DropDownList("Ambito", Model.Ambitos.CreateSelectList<AmbitoForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Ambito") %>
</p>
<p>
    <label>Sector de la instituci&oacute;n</label>
    <%=Html.DropDownList("Sector", Model.Sectores.CreateSelectList<SectorForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Sector") %>
</p>