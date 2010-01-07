<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResenaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre del libro</label>
    <span class="valor"><%=Html.Encode(Model.TituloLibro)%>&nbsp;</span>
</p>

<h4>Autor(es) del libro</h4>
<% Html.RenderPartial("_ShowAutorInterno", new AutorForm { AutoresInternos = Model.AutorInternoResenas, AutorSeOrdenaAlfabeticamente = Model.AutorSeOrdenaAlfabeticamente }); %>
<% Html.RenderPartial("_ShowAutorExterno", new AutorForm { AutoresExternos = Model.AutorExternoResenas, AutorSeOrdenaAlfabeticamente = Model.AutorSeOrdenaAlfabeticamente }); %>
<% Html.RenderPartial("_AutorEmptyListMessage", new AutorForm { AutoresExternos = Model.AutorExternoResenas, AutoresInternos = Model.AutorInternoResenas }); %>
<p>
    <label>Investigador</label>
    <span class="valor"><%=Html.Encode(Model.InvestigadorNombre) %></span>
</p>
<p>
    <label>Total de investigadores</label>
    <span id="totalautores" class="valor"><%=Html.Encode(Model.TotalAutores) %></span>	          
</p>
<p>
    <label>Posici&oacute;n del autor</label>
    <span class="valor"><%=Html.Encode(Model.PosicionAutor)%>&nbsp;</span>
</p>

<% Html.RenderPartial("_ShowEditorial", new EditorialForm { Editoriales = Model.EditorialResenas, ModelId = Model.Id }); %>

<p>
    <label>Pa&iacute;s</label>
    <span class="valor"><%=Html.Encode(Model.PaisNombre)%>&nbsp;</span>
</p>