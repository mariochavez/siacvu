<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#RamaId').html('');
$('#ClaseId').html('');

<% foreach (var rama in Model.Ramas) { %>
    var option = document.createElement("option");
    option.text = '<%= rama.Nombre%>';
    option.value = <%= rama.Id%>;
    $('#RamaId')[0].options.add(option);
<% } %>

<% foreach (var clase in Model.Clases) { %>
    var option = document.createElement("option");
    option.text = '<%= clase.Nombre%>';
    option.value = <%= clase.Id%>;
    $('#ClaseId')[0].options.add(option);
<% } %>