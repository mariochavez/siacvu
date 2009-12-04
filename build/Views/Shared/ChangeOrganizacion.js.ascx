<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#Nivel2Id').html('');

<% foreach (var nivel in Model.Niveles) { %>
    var option = document.createElement("option");
    option.text = '<%= nivel.Nombre%>';
    option.value = <%= nivel.Id%>;
    $('#Nivel2Id')[0].options.add(option);
<% } %>