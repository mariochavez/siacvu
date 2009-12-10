<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<RecursoFinancieroProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>


var html = '
    <div id="recursofinancieroEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>No hay recursos financieros registrados</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');
$('#recursofinanciero_<%=Html.Encode(Model.InstitucionId) %>').remove();

deleteElement(html, '#recursofinancieroList div[id^=recursofinanciero_]', '#recursofinancieroList');

if(<%=Html.Encode(Model.MonedaId)%> == 1){
    var pesos =  parseInt($('#totalpesos').text()) - parseInt(<%=Html.Encode(Model.Monto)%>);
    $('#totalpesos').text(pesos);
}
if(<%=Html.Encode(Model.MonedaId)%> == 2){
    var dolares =  parseInt($('#totaldolares').text()) - parseInt(<%=Html.Encode(Model.Monto)%>);
    $('#totaldolares').text(dolares);
}
    
setupSublistRows();