<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MiembroExternoGrupoInvestigacionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="miembroexternoEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>No hay miembros externos registrados</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');
$('#miembroexterno_<%=Html.Encode(Model.InvestigadorExternoId) %>').remove();

deleteElement(html, '#miembroexternoList div[id^=miembroexterno_]', '#miembroexternoList');

setupSublistRows();