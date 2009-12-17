<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResponsableProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>


var html = '
    <div id="responsableEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>No hay responsables registrados</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');
$('#responsable_<%=Html.Encode(Model.InvestigadorId) %>').remove();

deleteElement(html, '#responsableList div[id^=responsable_]', '#responsableList');

setupSublistRows();