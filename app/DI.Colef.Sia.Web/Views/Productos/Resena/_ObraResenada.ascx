<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResenaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre del libro</label>
    <%=Html.TextBox("TituloLibro", Model.TituloLibro, new { @class = "input420", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("TituloLibro")%>
</p>

<h4>Autor(es) del libro</h4>
<% Html.RenderPartial("_EditAutorInterno", new AutorForm { AutoresInternos = Model.AutorInternoResenas, ModelId = Model.Id }); %>
<% Html.RenderPartial("_EditAutorExterno", new AutorForm { AutoresExternos = Model.AutorExternoResenas, ModelId = Model.Id } ); %>

<% Html.RenderPartial("_EditEditorial", new EditorialForm { Editoriales = Model.EditorialResenas, ModelId = Model.Id } ); %>
    
<p>
    <label>Pa&iacute;s</label>
    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <%=Html.ValidationMessage("Pais") %>
</p>