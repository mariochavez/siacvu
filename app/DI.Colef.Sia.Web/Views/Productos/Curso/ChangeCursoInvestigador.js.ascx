<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CursoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if(Model.CursoInvestigadorId != 0){ %>
    $('#span_programaestudio').html('<%=Html.Encode(Model.ProgramaEstudioNombre)%>&nbsp;');
    $('#span_nivelestudio').html('<%=Html.Encode(Model.NivelEstudioNombre)%>&nbsp;');
    $('#span_fechainicio').html('<%=Html.Encode(Model.FechaInicial)%>&nbsp;');
    $('#span_fechafin').html('<%=Html.Encode(Model.FechaFinal)%>&nbsp;');
    $('#span_numerohoras').html('<%=Html.Encode(Model.NumeroHoras)%>&nbsp;');
<% } else { %>
    $('#span_programaestudio').html('&nbsp;');
    $('#span_nivelestudio').html('&nbsp;');
    $('#span_fechainicio').html('&nbsp;');
    $('#span_fechafin').html('&nbsp;');
    $('#span_numerohoras').html('&nbsp;');
<% } %>