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
$('#recursofinanciero_<%=Html.Encode(Model.Id) %>').remove();

deleteElement(html, '#recursofinancieroList div[id^=recursofinanciero_]', '#recursofinancieroList');

if(<%=Html.Encode(Model.MonedaId)%> == 1){
    var pesos =  parseFloat($('#totalpesos').text()) - parseFloat(<%=Html.Encode(Model.Monto)%>);
    $('#totalpesos').text(Math.round(pesos*100)/100);
}
if(<%=Html.Encode(Model.MonedaId)%> == 2){
    var dolares =  parseFloat($('#totaldolares').text()) - parseFloat(<%=Html.Encode(Model.Monto)%>);
    $('#totaldolares').text(Math.round(dolares*100)/100);
}
    
setupSublistRows();