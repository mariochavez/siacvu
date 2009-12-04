<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InstitucionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#EstadoPais').html('');

<% foreach (var estadoPais in Model.EstadosPaises) { %>
    var option = document.createElement("option");
    option.text = '<%= estadoPais.Nombre%>';
    option.value = <%= estadoPais.Id%>;
    $('#EstadoPais')[0].options.add(option);
<% } %>