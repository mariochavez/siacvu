<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InstitucionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Instituci&oacute;n</label>
	<%=Html.TextBox("Institucion.InstitucionNombre", "",
            new { @class = "autocomplete buscar-requerido", url = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <br /><span style="margin-left:165px;">(No use abreviaturas para la instituci&oacute;n)</span>
    <%=Html.Hidden("Institucion.InstitucionId", 0, new { rel = "#Institucion_InstitucionNombre" })%>
    <%=Html.ValidationMessage("Institucion.InstitucionNombre")%>
</p>