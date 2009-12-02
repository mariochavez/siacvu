<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TesisPosgradoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if(Model.Id != 0){ %>
    $('#span_nombrealumno').html('<%=Html.Encode(Model.NombreAlumno)%>&nbsp;');
    $('#span_titulotesis').html('<%=Html.Encode(Model.Titulo)%>&nbsp;');
    $('#span_vinculacionapyd').html('<%=Html.Encode(Model.VinculacionAPyDNombre)%>&nbsp;');
    $('#span_formaparticipacion').html('<%=Html.Encode(Model.FormaParticipacion)%>&nbsp;');
    $('#span_programaestudio').html('<%=Html.Encode(Model.ProgramaEstudioNombre)%>&nbsp;');
    $('#span_gradoacademico').html('<%=Html.Encode(Model.GradoAcademicoNombre)%>&nbsp;');
    $('#span_fechagrado').html('<%=Html.Encode(Model.FechaGrado)%>&nbsp;');
    $('#span_instituciontesis').html('<%=Html.Encode(Model.InstitucionNombre)%>&nbsp;');
    $('#span_paistesis').html('<%=Html.Encode(Model.InstitucionPaisNombre)%>&nbsp;');
    $('#span_area').html('<%=Html.Encode(Model.AreaNombre)%>&nbsp;');
    $('#span_disciplina').html('<%=Html.Encode(Model.DisciplinaNombre)%>&nbsp;');
    $('#span_subdisciplina').html('<%=Html.Encode(Model.SubdisciplinaNombre)%>&nbsp;');
    $('#span_sector').html('<%=Html.Encode(Model.SectorNombre)%>&nbsp;');
    $('#span_organizacion').html('<%=Html.Encode(Model.OrganizacionNombre)%>&nbsp;');
    $('#span_2donivel').html('<%=Html.Encode(Model.Nivel2Nombre)%>&nbsp;');
<% } else { %>
    $('#span_nombrealumno').html('&nbsp;');
    $('#span_titulotesis').html('&nbsp;');
    $('#span_vinculacionapyd').html('&nbsp;');
    $('#span_formaparticipacion').html('&nbsp;');
    $('#span_programaestudio').html('&nbsp;');
    $('#span_gradoacademico').html('&nbsp;');
    $('#span_fechagrado').html('&nbsp;');
    $('#span_instituciontesis').html('&nbsp;');
    $('#span_paistesis').html('&nbsp;');
    $('#span_area').html('&nbsp;');
    $('#span_disciplina').html('&nbsp;');
    $('#span_subdisciplina').html('&nbsp;');
    $('#span_sector').html('&nbsp;');
    $('#span_organizacion').html('&nbsp;');
    $('#span_2donivel').html('&nbsp;');
<% } %>