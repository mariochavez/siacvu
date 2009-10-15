<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CursoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#Organizacion').html('');
$('#Nivel2').html('');

<% foreach (var organizacion in Model.Organizaciones) { %>
    var option = document.createElement("option");
    option.text = '<%= organizacion.Nombre%>';
    option.value = <%= organizacion.Id%>;
    $('#Organizacion')[0].options.add(option);
<% } %>

<% foreach (var nivel in Model.Niveles2) { %>
    var option = document.createElement("option");
    option.text = '<%= nivel.Nombre%>';
    option.value = <%= nivel.Id%>;
    $('#Nivel2')[0].options.add(option);
<% } %>