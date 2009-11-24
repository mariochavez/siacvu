<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if(Model.AreaTematicaId != 0){ %>
    $('#span_lineatematica').html('<%=Html.Encode(Model.AreaTematicaLineaTematicaNombre)%>&nbsp;');
    $('#span_areaareatematica').html('<%=Html.Encode(Model.SubdisciplinaDisciplinaAreaNombre)%>&nbsp;<span class="cvu"></span>');
    $('#span_disciplinaareatematica').html('<%=Html.Encode(Model.SubdisciplinaDisciplinaNombre)%>&nbsp;<span class="cvu"></span>');
    $('#span_subdisciplinaareatematica').html('<%=Html.Encode(Model.SubdisciplinaNombre)%>&nbsp;<span class="cvu"></span>');
<% } else { %>
    $('#span_lineatematica').html('&nbsp;');
    $('#span_areaareatematica').html('&nbsp;');
    $('#span_disciplinaareatematica').html('&nbsp;');
    $('#span_subdisciplinaareatematica').html('&nbsp;');
<% } %>