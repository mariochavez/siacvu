<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if(Model.Nivel2Id != 0){ %>
    $('#span_sector').html('<%=Html.Encode(Model.Nivel2OrganizacionSectorNombre)%>&nbsp;<span class="cvu"></span>');
    $('#span_organizacion').html('<%=Html.Encode(Model.Nivel2OrganizacionNombre)%>&nbsp;<span class="cvu"></span>');
<% } else { %>
    $('#span_sector').html('&nbsp;');
    $('#span_organizacion').html('&nbsp;');
<% } %>