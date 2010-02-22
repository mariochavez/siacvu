<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<BaseForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#AreaTematicaId').html('');

<% foreach (var areasTematica in Model.AreasTematicas) { %>
    var option = document.createElement("option");
    option.text = '<%= areasTematica.Nombre %>';
    option.value = <%= areasTematica.Id %>;
    $('#AreaTematicaId')[0].options.add(option);
<% } %>

$('#AreaTematicaId').effect("highlight", {}, 1000);