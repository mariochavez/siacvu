<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<SesionEventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="sesionEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>No hay sesiones del evento estrat&eacute;gico registradas</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');
$('#sesion_<%=Html.Encode(Model.NombreSesion.Replace(" ", "_")) %>').remove();

deleteElement(html, '#sesionList div[id^=sesion_]', '#sesionList');

setupSublistRows();