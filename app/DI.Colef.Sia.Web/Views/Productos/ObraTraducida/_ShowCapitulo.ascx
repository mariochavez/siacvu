<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ObraTraducidaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Nombre del libro</label>
    <span class="valor"><%= Html.Encode(Model.NombreLibro)%>&nbsp;</span>
</p>

<h4>Autor(es) del libro</h4>
<% Html.RenderPartial("_ShowAutorInterno", new AutorForm { AutoresInternos = Model.AutorInternoObraTraducidas, AutorSeOrdenaAlfabeticamente = Model.AutorSeOrdenaAlfabeticamente }); %>
<% Html.RenderPartial("_ShowAutorExterno", new AutorForm { AutoresExternos = Model.AutorExternoObraTraducidas, AutorSeOrdenaAlfabeticamente = Model.AutorSeOrdenaAlfabeticamente }); %>
<% Html.RenderPartial("_AutorEmptyListMessage", new AutorForm { AutoresExternos = Model.AutorExternoObraTraducidas, AutoresInternos = Model.AutorInternoObraTraducidas }); %>
<p>
    <label>Due&ntilde;o del producto</label>
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

<p>
    <label>Tipo de libro</label>
    <span class="valor"><%= HumanizeHelper.TipoLibro(Model.TipoLibro)%>&nbsp;</span>
</p>

<% Html.RenderPartial("_ShowEditorial", new EditorialForm { Editoriales = Model.EditorialObraTraducidas, ModelId = Model.Id }); %>

<p>
    <label>Resumen</label>
    <span class="valor"><%= Html.Encode(Model.Resumen)%>&nbsp;</span>
</p>
<p>
    <label>Volumen</label>
    <span class="valor"><%= Html.Encode(Model.Volumen)%>&nbsp;</span>
</p>
<p>
    <label>De la p&aacute;gina</label>
    <span class="valor"><%= Html.Encode(Model.PaginaInicial)%>&nbsp;</span>
</p>
<p>    
    <label>A la p&aacute;gina</label>
    <span class="valor"><%= Html.Encode(Model.PaginaFinal)%>&nbsp;</span>
</p>
<p>
    <label>N&uacute;mero de citas</label>
    <span class="valor"><%= Html.Encode(Model.NoCitas)%>&nbsp;</span>
</p>