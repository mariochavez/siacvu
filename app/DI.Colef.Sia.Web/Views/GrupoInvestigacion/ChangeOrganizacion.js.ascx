<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<GrupoInvestigacionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#Nivel2').html('');
$('#Nivel3').html('');
$('#Nivel4').html('');
$('#Nivel5').html('');
$('#Nivel6').html('');

<% foreach (var nivel in Model.Niveles2) { %>
    var option = document.createElement("option");
    option.text = '<%= nivel.Nombre%>';
    option.value = <%= nivel.Id%>;
    $('#Nivel2')[0].options.add(option);
<% } %>

<% foreach (var nivel in Model.Niveles3){ %>
    var option = document.createElement("option");
    option.text = '<%= nivel.Nombre%>';
    option.value = <%= nivel.Id%>;
    $('#Nivel3')[0].options.add(option);
<% } %>

<% foreach (var nivel in Model.Niveles4){ %>
    var option = document.createElement("option");
    option.text = '<%= nivel.Nombre%>';
    option.value = <%= nivel.Id%>;
    $('#Nivel4')[0].options.add(option);
<% } %>

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