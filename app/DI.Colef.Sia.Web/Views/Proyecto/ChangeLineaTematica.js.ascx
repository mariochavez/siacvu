<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#AreaTematica').html('');

<% foreach (var areaTematica in Model.AreasTematicas) { %>
    var option = document.createElement("option");
    option.text = '<%= areaTematica.Nombre%>';
    option.value = <%= areaTematica.Id%>;
    $('#AreaTematica')[0].options.add(option);
<% } %>
