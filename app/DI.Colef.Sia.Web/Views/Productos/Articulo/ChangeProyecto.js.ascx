<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if (Model.ProyectoId != 0) { %>
    $('#lineatematica').html('<%=Html.Encode(Model.ProyectoLineaTematicaNombre)%>&nbsp;');
    $('#areatematica').html('<%=Html.Encode(Model.ProyectoAreaTematicaNombre)%>&nbsp;');
<% } %>