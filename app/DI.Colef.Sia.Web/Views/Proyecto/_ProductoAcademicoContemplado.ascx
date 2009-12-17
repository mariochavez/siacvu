<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Actividades a realizar</label>
    <%=Html.TextArea("Actividades", Model.Actividades, 5, 35, new { @class = "input420-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Actividades")%>
</p>
<p>
    <label>Productos acad&eacute;micos esperados</label>
    <%=Html.TextArea("ProductoAcademicoEsperado", Model.ProductoAcademicoEsperado, 5, 35, new { @class = "input420-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("ProductoAcademicoEsperado")%>
</p>