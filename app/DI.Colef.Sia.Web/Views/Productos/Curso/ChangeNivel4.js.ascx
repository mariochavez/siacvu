<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CursoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#Nivel5').html('');

<% foreach (var nivel in Model.Niveles5){ %>
    var option = document.createElement("option");
    option.text = '<%= nivel.Nombre%>';
    option.value = <%= nivel.Id%>;
    $('#Nivel5')[0].options.add(option);
<% } %>