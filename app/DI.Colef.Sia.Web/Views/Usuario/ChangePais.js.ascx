<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<FormacionAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#Direccion_EstadoPais').html('');

<% foreach (var estadoPais in Model.EstadosPaises) { %>
    var option = document.createElement("option");
    option.text = '<%= estadoPais.Nombre%>';
    option.value = <%= estadoPais.Id%>;
    $('#Direccion_EstadoPais')[0].options.add(option);
<% } %>