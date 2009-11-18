<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<p>
    <label>Ciudad</label>
    <span class="valor"><%= Html.Encode(Model.InstitucionCiudadNombre)%>&nbsp;</span>
</p>
<% if (Model.InstitucionTipoInstitucionNombre) { %>
	<p>
	    <label>Estado</label>
	    <span class="valor"><%= Html.Encode(Model.InstitucionEstadoPaisNombre)%>&nbsp;</span>
	</p>
<% } else { %>
    <p>
        <label>Pa&iacute;s</label>
        <span class="valor"><%= Html.Encode(Model.InstitucionPaisNombre)%>&nbsp;</span>
    </p>
<% } %>
<p>
    <label>Tipo de instituci&oacute;n</label>
    <span class="valor"><%= HumanizeHelper.TipoInstitucion(Model.InstitucionTipoInstitucionNombre)%>&nbsp;</span>
</p>