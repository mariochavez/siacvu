<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% if (Model.EventoId != 0) { %>
    $('#fechaevento').html('<%=Html.Encode(Model.EventoFechaInicial)%> - <%=Html.Encode(Model.EventoFechaFinal)%>&nbsp;');
<% } else { %>
    $('#fechaevento').html(' - &nbsp;');
<% } %>