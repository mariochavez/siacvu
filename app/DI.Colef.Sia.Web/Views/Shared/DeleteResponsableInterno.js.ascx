<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResponsableForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="responsableinternoEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>No hay responsables internos registrados</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');
$('#responsableinterno_<%=Html.Encode(Model.InvestigadorId) %>').remove();

deleteElement(html, '#responsableinternoList div[id^=responsableinterno_]', '#responsableinternoList');

var editores = ($('#responsableinternoList div[id^=responsableinterno_]').length) + ($('#responsableexternoList div[id^=responsableexterno_]').length);
$('#totaleditores').text(editores);

setupSublistRows();