<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ObraTraducidaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Nombre del libro</label>
    <span class="valor"><%= Html.Encode(Model.NombreLibro)%>&nbsp;</span>
</p>

<h4>Autor(es) del libro</h4>
    <% Html.RenderPartial("_ShowAutorInterno", new AutorForm { AutoresInternos = Model.AutorInternoObraTraducidas, ModelId = Model.Id }); %>
    <% Html.RenderPartial("_ShowAutorExterno", new AutorForm { AutoresExternos = Model.AutorExternoObraTraducidas, ModelId = Model.Id }); %>

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
    <label>N&uacute;mero de p&aacute;ginas</label>
    <span class="valor"><%= Html.Encode(Model.NoPaginas)%>&nbsp;</span>
</p>    
<p>
    <label>N&uacute;mero de citas</label>
    <span class="valor"><%= Html.Encode(Model.NoCitas)%>&nbsp;</span>
</p>