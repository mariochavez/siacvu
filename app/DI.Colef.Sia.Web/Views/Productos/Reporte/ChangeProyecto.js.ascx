<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ReporteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if (Model.ProyectoId != 0) { %>
    $('#lineatematica').html('<%=Html.Encode(Model.ProyectoLineaTematicaNombre)%>&nbsp;');
    $('#areatematica').html('<%=Html.Encode(Model.ProyectoAreaTematicaNombre)%>&nbsp;');
    $('#proyectopalabraclave1').html('<%=Html.Encode(Model.ProyectoPalabraClave1)%>&nbsp;');
    $('#proyectopalabraclave2').html('<%=Html.Encode(Model.ProyectoPalabraClave2)%>&nbsp;');
    $('#proyectopalabraclave3').html('<%=Html.Encode(Model.ProyectoPalabraClave3)%>&nbsp;');
<% } else { %>
    $('#lineatematica').html('&nbsp;');
    $('#areatematica').html('&nbsp;');
    $('#proyectopalabraclave1').html('&nbsp;');
    $('#proyectopalabraclave2').html('&nbsp;');
    $('#proyectopalabraclave3').html('&nbsp;');
<% } %>