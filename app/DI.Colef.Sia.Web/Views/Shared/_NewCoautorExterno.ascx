<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre</label>
    <%=Html.TextBox("CoautorExterno.Nombre", Model.InvestigadorExterno.Nombre, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("CoautorExterno.Nombre")%>
</p>
<p>
    <label>Apellido paterno</label>
    <%=Html.TextBox("CoautorExterno.ApellidoPaterno", Model.InvestigadorExterno.ApellidoPaterno, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("CoautorExterno.ApellidoPaterno")%>
</p>
<p>
    <label>Apellido materno</label>
    <%=Html.TextBox("CoautorExterno.ApellidoMaterno", Model.InvestigadorExterno.ApellidoMaterno, new { @class = "input250", maxlength = 40 })%>
    <%=Html.ValidationMessage("CoautorExterno.ApellidoMaterno")%>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <%=Html.TextBox("CoautorExterno.Institucion", "",
        new { @class = "autocomplete buscar-requerido", url = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("CoautorExterno.InstitucionId", 0, new { rel = "#CoautorExterno_Institucion" })%>
    <%=Html.ValidationMessage("CoautorExterno.InstitucionId")%>
    <%=Html.Hidden("CoautorExterno.EsAlfabeticamente", Model.EsAlfabeticamente)%>
</p>
<%if(!Model.EsAlfabeticamente){ %>
    <p>
        <label>Posici&oacute;n</label>
        <%=Html.TextBox("CoautorExterno.Posicion", 2, new { @class = "input100-requerido", maxlength = 2 })%>
    </p>
<% } %>