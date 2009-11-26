<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if(Model.ProyectoId != 0){ %>
    $('#span_lineaproyecto').html('<%=Html.Encode(Model.ProyectoAreaTematicaLineaTematicaNombre)%>&nbsp;');
    $('#span_areatematicaproyecto').html('<%=Html.Encode(Model.ProyectoAreaTematicaNombre)%>&nbsp;');
    $('#span_areaproyecto').html('<%=Html.Encode(Model.ProyectoAreaTematicaSubdisciplinaDisciplinaAreaNombre)%>&nbsp;<span class="cvu"></span>');
    $('#span_disciplinaproyecto').html('<%=Html.Encode(Model.ProyectoAreaTematicaSubdisciplinaDisciplinaNombre)%>&nbsp;<span class="cvu"></span>');
    $('#span_subdisciplinaproyecto').html('<%=Html.Encode(Model.ProyectoAreaTematicaSubdisciplinaNombre)%>&nbsp;<span class="cvu"></span>');
<% } else { %>
    $('#span_lineaproyecto').html('&nbsp;');
    $('#span_areatematicaproyecto').html('&nbsp;');
    $('#span_areaproyecto').html('&nbsp;');
    $('#span_disciplinaproyecto').html('&nbsp;');
    $('#span_subdisciplinaproyecto').html('&nbsp;');
<% } %>