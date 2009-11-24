<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<% if(!Model.IsShowForm){ %>
    <p>
        <label>Instituci&oacute;n</label>
        <%=Html.TextBox("InstitucionNombre", Model.InstitucionNombre,
                new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
        <%=Html.Hidden("InstitucionId", Model.InstitucionId, new { rel = "#InstitucionNombre", url = Url.Action("ChangeInstitucion") })%>
        <%=Html.ValidationMessage("InstitucionNombre")%>
    </p>
<% } else { %>
    <p>
        <label>Instituci&oacute;n</label>
        <span class="valor"><%= Html.Encode(Model.InstitucionNombre)%>&nbsp;</span>
    </p>
<% } %>
<p>
    <label>Ciudad</label>
    <span id="span_ciudad" class="valor"><%= Html.Encode(Model.InstitucionCiudad)%>&nbsp;</span>
</p>
<p>
    <label>Estado</label>
    <span id="span_estado" class="valor"><%= Html.Encode(Model.InstitucionEstadoPaisNombre)%>&nbsp;</span>
</p>
<p>
    <label>Pa&iacute;s</label>
    <span id="span_pais" class="valor"><%= Html.Encode(Model.InstitucionPaisNombre)%>&nbsp;</span>
</p>
<p>
    <label>Tipo de instituci&oacute;n</label>
    <span id="span_tipoinstitucion" class="valor"><%= HumanizeHelper.TipoInstitucion(Model.InstitucionTipoInstitucionNombre)%>&nbsp;</span>
</p>