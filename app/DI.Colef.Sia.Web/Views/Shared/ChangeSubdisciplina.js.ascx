<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if(Model.SubdisciplinaId != 0){ %>
    $('#span_area').html('<%=Html.Encode(Model.SubdisciplinaDisciplinaAreaNombre)%>&nbsp;<span class="cvu"></span>');
    $('#span_disciplina').html('<%=Html.Encode(Model.SubdisciplinaDisciplinaNombre)%>&nbsp;<span class="cvu"></span>');
<% } else { %>
    $('#span_area').html('&nbsp;');
    $('#span_disciplina').html('&nbsp;');
<% } %>