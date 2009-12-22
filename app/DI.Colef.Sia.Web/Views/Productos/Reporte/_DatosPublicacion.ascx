<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ReporteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre de la publicaci&oacute;n</label>
    <%=Html.TextBox("Titulo", Model.Titulo, new { @class = "input420-bold-requerido", maxlength = 200 })%>    
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Titulo")%>
</p>
<p>
    <label>Tipo de publicaci&oacute;n</label>
    <%=Html.DropDownList("TipoReporte", Model.TiposReportes.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("TipoReporte") %>
</p>