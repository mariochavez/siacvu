<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#DisciplinaId').html('');
$('#SubdisciplinaId').html('');

<% foreach (var disciplina in Model.Disciplinas) { %>
    var option = document.createElement("option");
    option.text = '<%= disciplina.Nombre%>';
    option.value = <%= disciplina.Id%>;
    $('#DisciplinaId')[0].options.add(option);
<% } %>

<% foreach (var subdisciplina in Model.Subdisciplinas) { %>
    var option = document.createElement("option");
    option.text = '<%= subdisciplina.Nombre%>';
    option.value = <%= subdisciplina.Id%>;
    $('#SubdisciplinaId')[0].options.add(option);
<% } %>