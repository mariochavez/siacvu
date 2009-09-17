<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#Disciplina').html('');
$('#Subdisciplina').html('');

<% foreach (var disciplina in Model.Disciplinas) { %>
    var option = document.createElement("option");
    option.text = '<%= disciplina.Nombre %>';
    option.value = <%= disciplina.Id %>;
    $('#Disciplina')[0].options.add(option);
<% } %>

<% foreach (var subdisciplina in Model.Subdisciplinas) { %>
    var option = document.createElement("option");
    option.text = '<%= subdisciplina.Nombre%>';
    option.value = <%= subdisciplina.Id%>;
    $('#Subdisciplina')[0].options.add(option);
<% } %>
