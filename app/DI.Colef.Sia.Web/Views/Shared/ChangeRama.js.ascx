<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#ClaseId').html('');

<% foreach (var clase in Model.Clases) { %>
    var option = document.createElement("option");
    option.text = '<%= clase.Nombre%>';
    option.value = <%= clase.Id%>;
    $('#ClaseId')[0].options.add(option);
<% } %>