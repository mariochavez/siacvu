<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>

<%--<% Html.RenderPartial("_ShowRevista", new ShowFieldsForm { RevistaPublicacionId = Model.RevistaPublicacionId, RevistaPublicacionTitulo = Model.RevistaPublicacionTitulo, RevistaLabel = "Nombre de la revista", IsShowForm = false }); %>--%>

<p>
    <label>Nombre de la revista</label>
    <%=Html.TextBox("RevistaPublicacionTitulo", Model.RevistaPublicacionTitulo,
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("SearchRevistaTipoABC", "RevistaPublicacion"), maxlength = 100 })%>
    <%=Html.Hidden("RevistaPublicacionId", Model.RevistaPublicacionId, new { rel = "#RevistaPublicacionTitulo" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("RevistaPublicacionTitulo")%>
</p>

<p>
    <label>Volumen</label>
    <%=Html.TextBox("Volumen", Model.Volumen, new { @class = "input100", maxlength = 4 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Volumen")%>
</p>
<p>
    <label>N&uacute;mero</label>
    <%=Html.TextBox("Numero", Model.Numero, new { @class = "input100", maxlength = 4 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Numero")%>
</p>
<p>
    <label>De la p&aacute;gina</label>
    <%=Html.TextBox("PaginaInicial", Model.PaginaInicial, new { @class = "input100", maxlength = 4, size = 14 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("PaginaInicial")%>
</p>
<p>    
    <label>A la p&aacute;gina</label>
    <%=Html.TextBox("PaginaFinal", Model.PaginaFinal, new { @class = "input100", maxlength = 4, size = 14 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("PaginaFinal")%>
</p>