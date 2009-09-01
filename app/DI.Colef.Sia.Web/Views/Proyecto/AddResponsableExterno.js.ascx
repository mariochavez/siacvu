<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResponsableInternoProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <tr id="responsableinterno_<%=Html.Encode(Model.Id) %>">
        <td class="subform">
            <%=Html.Encode(Model.InvestigadorExternoNombre) %>
        </td>
    </tr>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#responsableinterno_form').hide();
$('#responsableinterno_new').show();
$('#responsableinterno_form').html('');
$('#responsableinternoEmptyList_form').html('');
$('#responsableinternoList tr:first').after(html);

$('#responsableinterno_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#responsableinterno_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');
<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResponsableExternoProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <tr id="responsableexterno_<%=Html.Encode(Model.Id) %>">
        <td class="subform">
            <%=Html.Encode(Model.InvestigadorExternoNombre) %>
        </td>
    </tr>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#responsableexterno_form').hide();
$('#responsableexterno_new').show();
$('#responsableexterno_form').html('');
$('#responsableexternoEmptyList_form').html('');
$('#responsableexternoList tr:first').after(html);

$('#responsableexterno_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#responsableexterno_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');
<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipanteInternoProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <tr id="participanteinterno_<%=Html.Encode(Model.Id) %>">
        <td class="subform">
            <%=Html.Encode(Model.InvestigadorExternoNombre) %>
        </td>
    </tr>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#participanteinterno_form').hide();
$('#participanteinterno_new').show();
$('#participanteinterno_form').html('');
$('#participanteinternoEmptyList_form').html('');
$('#participanteinternoList tr:first').after(html);

$('#participanteinterno_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#participanteinterno_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');
<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipanteExternoProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <tr id="participanteexterno_<%=Html.Encode(Model.Id) %>">
        <td class="subform">
            <%=Html.Encode(Model.InvestigadorExternoNombre) %>
        </td>
    </tr>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#participanteexterno_form').hide();
$('#participanteexterno_new').show();
$('#participanteexterno_form').html('');
$('#participanteexternoEmptyList_form').html('');
$('#participanteexternoList tr:first').after(html);

$('#participanteexterno_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#participanteexterno_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');
