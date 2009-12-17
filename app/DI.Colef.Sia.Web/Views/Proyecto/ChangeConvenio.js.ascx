<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ConvenioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if(Model.Id != 0){ %>
    $('#span_fechafirma').html('<%=Html.Encode(Model.FechaFirma)%>&nbsp;');
    $('#span_fechaconclusion').html('<%=Html.Encode(Model.FechaConclusion)%>&nbsp;');
    $('#span_terminoreferencia').html('<%=Html.Encode(Model.TerminoReferencia)%>&nbsp;');
    $('#span_productocomprometido').html('<%=Html.Encode(Model.ProductoComprometido)%>&nbsp;');
<% } else { %>
    $('#span_fechafirma').html('&nbsp;');
    $('#span_fechaconclusion').html('&nbsp;');
    $('#span_terminoreferencia').html('&nbsp;');
    $('#span_productocomprometido').html('&nbsp;'); 
<% } %>