<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if(Model.ClaseId != 0){ %>
    $('#span_sectoreconomico').html('<%=Html.Encode(Model.ClaseRamaSectorEconomicoNombre)%>&nbsp;<span class="cvu"></span>');
    $('#span_rama').html('<%=Html.Encode(Model.ClaseRamaNombre)%>&nbsp;<span class="cvu"></span>');
<% } else { %>
    $('#span_sectoreconomico').html('&nbsp;');
    $('#span_rama').html('&nbsp;');
<% } %>