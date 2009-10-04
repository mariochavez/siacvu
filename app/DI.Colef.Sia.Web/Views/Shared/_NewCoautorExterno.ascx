<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Coautor externo</label>
    <%=Html.TextBox("CoautorExterno.Nombre", "",
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "InvestigadorExterno"), maxlength = 100 })%>
    <%=Html.Hidden("CoautorExterno.InvestigadorExternoId", 0, new { rel = "#CoautorExterno_Nombre" })%>
</p>
<p>
    <label>Posici&oacute;n coautor externo</label>
    <%=Html.TextBox("CoautorExterno.Posicion", 2, new { @class = "input100", maxlength = 3 })%>
</p>
<p>
	<label>Instituci&oacute;n acad&eacute;mica</label>
	<%=Html.TextBox("CoautorExterno.InstitucionNombre", "",
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("CoautorExterno.InstitucionId", 0, new { rel = "#CoautorExterno_InstitucionNombre" })%>
</p>