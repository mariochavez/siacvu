<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<h4>Autor(es) del libro</h4>
<% Html.RenderPartial("_EditAutorInterno", new AutorForm { AutoresInternos = Model.AutorInternoCapitulos, ModelId = Model.Id }); %>
<% Html.RenderPartial("_EditAutorExterno", new AutorForm { AutoresExternos = Model.AutorExternoCapitulos, ModelId = Model.Id } ); %>

<% Html.RenderPartial("_EditEditorial", new EditorialForm { Editoriales = Model.EditorialCapitulos, ModelId = Model.Id } ); %>

<p>
    <label>Resumen</label>
    <%=Html.TextArea("Resumen", Model.Resumen, 3, 35, new { @class = "input420", maxlength = 500 })%>
    <span class="cvu"></span>
</p>
<p>
    <label>Volumen</label>
    <%=Html.TextBox("Volumen", Model.Volumen, new { @class = "input100", maxlength = 4 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Volumen")%>
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
<p>
    <label>No. de citas</label>
    <%=Html.TextBox("NoCitas", Model.NoCitas, new { @class = "input100", maxlength = 4 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("NoCitas")%>
</p>