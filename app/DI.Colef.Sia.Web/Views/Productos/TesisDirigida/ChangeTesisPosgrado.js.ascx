<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TesisDirigidaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if(Model.TesisPosgradoId != 0){ %>
    $('#span_nombrealumno').html('<%=Html.Encode(Model.NombreAlumno)%>&nbsp;');
    $('#span_titulotesis').html('<%=Html.Encode(Model.Titulo)%>&nbsp;');
    $('#span_vinculacionapyd').html('<%=Html.Encode(Model.VinculacionAPyDNombre)%>&nbsp;');
    $('#span_formaparticipacion').html('<%=Html.Encode(Model.FormaParticipacion)%>&nbsp;');
    $('#span_programaestudio').html('<%=Html.Encode(Model.ProgramaEstudioNombre)%>&nbsp;');
    $('#span_gradoacademico').html('<%=Html.Encode(Model.GradoAcademicoNombre)%>&nbsp;');
    $('#span_fechagrado').html('<%=Html.Encode(Model.FechaGrado)%>&nbsp;');
<% } else { %>
    $('#span_nombrealumno').html('&nbsp;');
    $('#span_titulotesis').html('&nbsp;');
    $('#span_vinculacionapyd').html('&nbsp;');
    $('#span_formaparticipacion').html('&nbsp;');
    $('#span_programaestudio').html('&nbsp;');
    $('#span_gradoacademico').html('&nbsp;');
    $('#span_fechagrado').html('&nbsp;');
<% } %>