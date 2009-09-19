<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<GrupoInvestigacionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#Nivel5').html('');
$('#Nivel6').html('');

<% foreach (var nivel in Model.Niveles5){ %>
    var option = document.createElement("option");
    option.text = '<%= nivel.Nombre%>';
    option.value = <%= nivel.Id%>;
    $('#Nivel5')[0].options.add(option);
<% } %>

<% foreach (var nivel in Model.Niveles6){ %>
    var option = document.createElement("option");
    option.text = '<%= nivel.Nombre%>';
    option.value = <%= nivel.Id%>;
    $('#Nivel6')[0].options.add(option);
<% } %>