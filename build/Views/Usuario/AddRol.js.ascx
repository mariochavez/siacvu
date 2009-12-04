<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<RolForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="rol_<%=Html.Encode(Model.Id) %>" class="sublista">
        <h6><%=Html.Encode(Model.Nombre)%></h6>
    </div><!--end estadolista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#rol_form').hide();
$('#rol_new').show();
$('#rol_form').html('');
$('#rolList div:first').before(html);

$('#rol_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#rol_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');

setupSublistRows();
