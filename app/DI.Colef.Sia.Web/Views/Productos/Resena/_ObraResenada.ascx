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
<% Html.RenderPartial("_AddAutoresButtons", new AutorForm { ModelId = Model.Id, AutorSeOrdenaAlfabeticamente = Model.AutorSeOrdenaAlfabeticamente}); %>
<% Html.RenderPartial("_EditAutorInterno", new AutorForm { AutoresInternos = Model.AutorInternoResenas, ModelId = Model.Id, AutorSeOrdenaAlfabeticamente = Model.AutorSeOrdenaAlfabeticamente }); %>
<% Html.RenderPartial("_EditAutorExterno", new AutorForm { AutoresExternos = Model.AutorExternoResenas, ModelId = Model.Id, AutorSeOrdenaAlfabeticamente = Model.AutorSeOrdenaAlfabeticamente }); %>
<% Html.RenderPartial("_AutorEmptyListMessage", new AutorForm { AutoresExternos = Model.AutorExternoResenas, AutoresInternos = Model.AutorInternoResenas }); %>
<p>
    <label>Due&ntilde;o del producto</label>
    <span class="valor"><%=Html.Encode(Model.InvestigadorNombre1) %></span>
</p>
<p id="AutorSeOrdenaAlfabeticamente_field">
    <label>Posici&oacute;n del autor</label>
    <%=Html.TextBox("PosicionAutor", Model.PosicionAutor, new { @class = "input100-requerido", maxlength = 2 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("PosicionAutor")%>
</p>
<p>
    <label>Total de investigadores</label>
    <span id="totalautores" class="valor"><%=Html.Encode(Model.TotalAutores) %></span>
    <span class="cvu"></span>
</p>

<% Html.RenderPartial("_EditEditorial", new EditorialForm { Editoriales = Model.EditorialResenas, ModelId = Model.Id } ); %>
    
<p>
    <label>Pa&iacute;s</label>
    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <%=Html.ValidationMessage("Pais") %>
</p>