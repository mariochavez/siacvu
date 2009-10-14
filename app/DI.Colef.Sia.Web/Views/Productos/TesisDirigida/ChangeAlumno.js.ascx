<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TesisDirigidaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if (Model.AlumnoId != 0){ %>
    $('#programaestudiointerno').html('<%=Html.Encode(Model.AlumnoProgramaEstudioNombre)%>&nbsp;<span class="cvu"></span>');
    $('#gradoacademicointerno').html('<%=Html.Encode(Model.AlumnoGradoAcademicoNombre)%>&nbsp;<span class="cvu"></span>');
<% } else { %>
    $('#programaestudiointerno').html('&nbsp;');
    $('#gradoacademicointerno').html('&nbsp;');
<% } %>