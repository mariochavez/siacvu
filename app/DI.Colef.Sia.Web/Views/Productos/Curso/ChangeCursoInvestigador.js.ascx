<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CursoInvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if(Model.Id != 0){ %>
    $('#span_programaestudio').html('<%=Html.Encode(Model.ProgramaEstudioNombre)%>&nbsp;');
    $('#span_nivelestudio').html('<%=Html.Encode(Model.NivelEstudioNombre)%>&nbsp;');
    $('#span_fechainicio').html('<%=Html.Encode(Model.FechaInicial)%>&nbsp;');
    $('#span_fechafin').html('<%=Html.Encode(Model.FechaFinal)%>&nbsp;');
    $('#span_numerohoras').html('<%=Html.Encode(Model.NumeroHoras)%>&nbsp;');
    $('#span_institucioncurso').html('<%=Html.Encode(Model.InstitucionNombre)%>&nbsp;');
    $('#span_paiscurso').html('<%=Html.Encode(Model.InstitucionPaisNombre)%>&nbsp;');
    $('#span_sector').html('<%=Html.Encode(Model.SectorNombre)%>&nbsp;');
    $('#span_organizacion').html('<%=Html.Encode(Model.OrganizacionNombre)%>&nbsp;');
    $('#span_2donivel').html('<%=Html.Encode(Model.Nivel2Nombre)%>&nbsp;');
<% } else { %>
    $('#span_programaestudio').html('&nbsp;');
    $('#span_nivelestudio').html('&nbsp;');
    $('#span_fechainicio').html('&nbsp;');
    $('#span_fechafin').html('&nbsp;');
    $('#span_numerohoras').html('&nbsp;');
    $('#span_institucioncurso').html('&nbsp;');
    $('#span_paiscurso').html('&nbsp;');
    $('#span_sector').html('&nbsp;');
    $('#span_organizacion').html('&nbsp;');
    $('#span_2donivel').html('&nbsp;');
<% } %>