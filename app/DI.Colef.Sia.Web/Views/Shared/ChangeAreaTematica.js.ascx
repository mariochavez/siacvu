<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if(Model.AreaTematicaId != 0){ %>
    $('#span_lineatematica').html('<%=Html.Encode(Model.AreaTematicaLineaTematicaNombre)%>&nbsp;');
<% } else { %>
    $('#span_lineatematica').html('&nbsp;');
<% } %>