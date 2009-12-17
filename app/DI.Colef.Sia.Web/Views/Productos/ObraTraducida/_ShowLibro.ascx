<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ObraTraducidaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>

<% Html.RenderPartial("_ShowEditorial", new EditorialForm { Editoriales = Model.EditorialObraTraducidas, ModelId = Model.Id }); %>
				    
<p>
    <label>ISBN</label>
    <span class="valor"><%= Html.Encode(Model.ISBN)%>&nbsp;</span>
</p>
<p>
    <label>Edici&oacute;n</label>
    <span class="valor"><%= HumanizeHelper.Edicion(Model.Edicion)%>&nbsp;</span>
</p>
<p>
    <label>Reimpresi&oacute;n</label>
    <span class="valor"><%= HumanizeHelper.Reimpresion(Model.Reimpresion)%>&nbsp;</span>
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
    <label>Tiraje</label>
    <span class="valor"><%= Html.Encode(Model.Tiraje)%>&nbsp;</span>
</p>