<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#OrganizacionId').html('');
$('#Nivel2Id').html('');

<% foreach (var organizacion in Model.Organizaciones) { %>
    var option = document.createElement("option");
    option.text = '<%= organizacion.Nombre%>';
    option.value = <%= organizacion.Id%>;
    $('#OrganizacionId')[0].options.add(option);
<% } %>

<% foreach (var nivel in Model.Niveles) { %>
    var option = document.createElement("option");
    option.text = '<%= nivel.Nombre%>';
    option.value = <%= nivel.Id%>;
    $('#Nivel2Id')[0].options.add(option);
<% } %>