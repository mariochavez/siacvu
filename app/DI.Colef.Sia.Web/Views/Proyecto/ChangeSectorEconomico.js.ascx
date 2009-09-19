<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#Rama').html('');
$('#Clase').html('');

<% foreach (var rama in Model.Ramas) { %>
    var option = document.createElement("option");
    option.text = '<%= rama.Nombre%>';
    option.value = <%= rama.Id%>;
    $('#Rama')[0].options.add(option);
<% } %>

<% foreach (var clase in Model.Clases) { %>
    var option = document.createElement("option");
    option.text = '<%= clase.Nombre%>';
    option.value = <%= clase.Id%>;
    $('#Clase')[0].options.add(option);
<% } %>