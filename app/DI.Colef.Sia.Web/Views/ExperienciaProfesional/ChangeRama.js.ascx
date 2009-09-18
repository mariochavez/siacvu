<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ExperienciaProfesionalForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#Clase').html('');

<% foreach (var clase in Model.Clases) { %>
    var option = document.createElement("option");
    option.text = '<%= clase.Nombre%>';
    option.value = <%= clase.Id%>;
    $('#Clase')[0].options.add(option);
<% } %>
