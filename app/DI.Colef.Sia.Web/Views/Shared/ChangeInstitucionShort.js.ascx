<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if(Model.InstitucionId != 0){ %>
    $('#span_pais').html('<%=Html.Encode(Model.InstitucionPaisNombre)%>&nbsp;');
<% } else { %>
    $('#span_pais').html('&nbsp;');
<% } %>