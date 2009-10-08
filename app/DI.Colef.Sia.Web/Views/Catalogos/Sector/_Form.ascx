<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<SectorForm>" %>
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
    <label>Tipo de art&iacute;culo</label>
    <%=Html.DropDownList("TipoSector", Model.TiposSectores.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
                        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("TipoSector") %>
</p>
