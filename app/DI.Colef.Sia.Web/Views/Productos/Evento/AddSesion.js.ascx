<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<SesionEventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="sesion_<%=Html.Encode(Model.Id) %>" class="sublista">
        <h6><%=Html.Encode(Model.NombreSesion)%> <span><%=Html.Encode(Model.ObjetivoSesion)%>, <%=Html.Encode(Model.AmbitoNombre)%></span></h6>
        <span><%=Html.Encode(Model.FechaEvento)%>, <%=Html.Encode(Model.Lugar) %></span>
    </div><!--end estadolista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#sesionForm').hide();
$('#sesionNew').show();
$('#sesionForm').html('');
$('#sesionList div:first').before(html);

$('#sesion_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#sesion_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');

setupSublistRows();