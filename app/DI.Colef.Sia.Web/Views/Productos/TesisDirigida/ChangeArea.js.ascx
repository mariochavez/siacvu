<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TesisDirigidaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#Disciplina').html('');

<% foreach (var disciplina in Model.Disciplinas) { %>
    var option = document.createElement("option");
    option.text = '<%= disciplina.Nombre %>';
    option.value = <%= disciplina.Id %>;
    $('#Disciplina')[0].options.add(option);
<% } %>
